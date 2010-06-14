using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;

namespace Monopoly.Tests.NUnit
{
    [TestFixture]
    public class Specification
    {
        [SetUp]
        public void Initialize()
        {
            Before_each();
            Because();
        }

        [TearDown]
        public void Cleanup()
        {
            After_each();
        }

        protected virtual void Before_each() { }
        protected virtual void After_each() { }
        protected virtual void Because() { }

        protected void spec_not_implemented(string specName)
        {
            Console.WriteLine("Specification not implemented : " + specName);
        }

    }
}
