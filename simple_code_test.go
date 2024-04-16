package simple_code

import "testing"

func TestSum(t *testing.T) {
	got := Sum(2, 3)
	if got != 5 {
		t.Errorf("sum(2,3) = %d; want 5", got)
	}
}
