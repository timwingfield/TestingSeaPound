using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Monopoly
{
    public interface IPlayerRepository
    {
        Player GetPlayerByName(string name);
        bool SavePlayer(Player player);
    }

    class PlayerRepository : IPlayerRepository
    {
        public Player GetPlayerByName(string name)
        {
            throw new NotImplementedException();
        }

        public bool SavePlayer(Player player)
        {
            throw new NotImplementedException();
        }
    }
}
