#include <linux/kernel.h>
#include <linux/module.h>

MODULE_LICENSE("GPL");

static int __init hello_init(void) {
  // runs when the module is loaded
  printk(KERN_INFO "Hello, kernel module!\n");
  return 0;
}

static void __exit hello_exit(void) {
  // runs when the module is removed
  printk(KERN_INFO "Goodbye, kernel module!\n");
}

module_init(hello_init);
module_exit(hello_exit);
