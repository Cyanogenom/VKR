cdef extern from "main.h":
	void hello(const char *name)
	int test_some(const int led_number) except *

def py_hello(name: bytes) -> None:
	hello(name)

def py_test_some(led_number: int) -> int:
	try:
		res = test_some(led_number)
	except Exception as e:
		print(e)
	return 0