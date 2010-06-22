using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Monopoly
{
    public interface IPlayerService
    {
        Player GetPlayerByName(string name);
        bool SavePlayer(Player player);
    }

    public class PlayerService
    {
        IPlayerRepository _playerRepository;

        public PlayerService() : this(null) { }

        public PlayerService(IPlayerRepository playerRepository)
        {
            _playerRepository = playerRepository ?? new PlayerRepository();
        }

        public Player GetPlayerByName(string name)
        {
            return _playerRepository.GetPlayerByName(name);
        }

        public bool SavePlayer(Player player)
        {
            return _playerRepository.SavePlayer(player);
        }
    }
}
