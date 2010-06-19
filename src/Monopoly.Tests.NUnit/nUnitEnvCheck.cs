using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;

namespace Monopoly.Tests.NUnit
{
    public class When_verifying_the_nunit_environment
    {
        Player p;
        [SetUp]
        public void Because()
        {
            p = new Player();
        }

        [Test]
        public void then_the_player_should_not_be_null()
        {
            Assert.That(p, Is.Not.Null);
        }
    }
}
