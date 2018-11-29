From: dan.carpenter at oracle.com (Dan Carpenter)
Date: Thu, 29 Nov 2018 17:38:16 +0300
Subject: [bug report] kvm: selftests: introduce ucall
Message-ID: <20181129143816.tjgiq3o7hrw74d2o@kili.mountain>

Hello Andrew Jones,

The patch 14c47b7530e2: "kvm: selftests: introduce ucall" from Sep
18, 2018, leads to the following static checker warning:

	./tools/testing/selftests/kvm/lib/ucall.c:61 ucall_init()
	warn: always true condition '(gpa >= 0) => (0-u64max >= 0)'

./tools/testing/selftests/kvm/lib/ucall.c
    28  void ucall_init(struct kvm_vm *vm, ucall_type_t type, void *arg)
    29  {
    30          ucall_type = type;
    31          sync_global_to_guest(vm, ucall_type);
    32  
    33          if (type == UCALL_PIO)
    34                  return;
    35  
    36          if (type == UCALL_MMIO) {
    37                  vm_paddr_t gpa, start, end, step;

vm_paddr_t is a u64.


    38                  bool ret;
    39  
    40                  if (arg) {
    41                          gpa = (vm_paddr_t)arg;
    42                          ret = ucall_mmio_init(vm, gpa);
    43                          TEST_ASSERT(ret, "Can't set ucall mmio address to %lx", gpa);
    44                          return;
    45                  }
    46  
    47                  /*
    48                   * Find an address within the allowed virtual address space,
    49                   * that does _not_ have a KVM memory region associated with it.
    50                   * Identity mapping an address like this allows the guest to
    51                   * access it, but as KVM doesn't know what to do with it, it
    52                   * will assume it's something userspace handles and exit with
    53                   * KVM_EXIT_MMIO. Well, at least that's how it works for AArch64.
    54                   * Here we start with a guess that the addresses around two
    55                   * thirds of the VA space are unmapped and then work both down
    56                   * and up from there in 1/6 VA space sized steps.
    57                   */
    58                  start = 1ul << (vm->va_bits * 2 / 3);
    59                  end = 1ul << vm->va_bits;
    60                  step = 1ul << (vm->va_bits / 6);
    61                  for (gpa = start; gpa >= 0; gpa -= step) {
                                          ^^^^^^^^
So this doesn't work.

    62                          if (ucall_mmio_init(vm, gpa & ~(vm->page_size - 1)))
    63                                  return;
    64                  }
    65                  for (gpa = start + step; gpa < end; gpa += step) {
    66                          if (ucall_mmio_init(vm, gpa & ~(vm->page_size - 1)))
    67                                  return;
    68                  }
    69                  TEST_ASSERT(false, "Can't find a ucall mmio address");
    70          }
    71  }

regards,
dan carpenter
