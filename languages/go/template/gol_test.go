package gol;

import(
    "testing"
    . "gopkg.in/check.v1"
)

// Don't touch, just a hook for gocheck
func Test(t *testing.T) { TestingT(t) }

type GolSuite struct {}

var _ = Suite(&GolSuite{})

func (s *GolSuite) TestMethod(c *C) {
    c.Assert(1, Equals, Method())
}
