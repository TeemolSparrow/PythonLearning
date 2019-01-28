import unittest
from name import get_formatted_name


class NameTestCase(unittest.TestCase):

    def test_full_name(self):
        full_name = get_formatted_name("Teemol", "K", "Sparrow")
        self.assertEqual(full_name, "Teemol Sparrow")


unittest.main()
