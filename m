From: thuth@redhat.com (Thomas Huth)
Date: Thu, 16 May 2019 13:12:49 +0200
Subject: [RFC PATCH 0/4] KVM selftests for s390x
Message-ID: <20190516111253.4494-1-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190516111249.gOXWXmzQlQ_woqkvL6mdbKuygYdP6zpX-xJvyNc4UGE@z>

This patch series enables the KVM selftests for s390x. As a first
test, the sync_regs from x86 has been adapted to s390x.

Please note that the ucall() interface is not used yet - since
s390x neither has PIO nor MMIO, this needs some more work first
before it becomes usable (we likely should use a DIAG hypercall
here, which is what the sync_reg test is currently using, too...).

Thomas Huth (4):
  KVM: selftests: Guard struct kvm_vcpu_events with
    __KVM_HAVE_VCPU_EVENTS
  KVM: selftests: Align memory region addresses to 1M on s390x
  KVM: selftests: Add processor code for s390x
  KVM: selftests: Add the sync_regs test for s390x

 MAINTAINERS                                   |   2 +
 tools/testing/selftests/kvm/Makefile          |   3 +
 .../testing/selftests/kvm/include/kvm_util.h  |   2 +
 .../selftests/kvm/include/s390x/processor.h   |  22 ++
 tools/testing/selftests/kvm/lib/kvm_util.c    |  24 +-
 .../selftests/kvm/lib/s390x/processor.c       | 277 ++++++++++++++++++
 .../selftests/kvm/s390x/sync_regs_test.c      | 151 ++++++++++
 7 files changed, 476 insertions(+), 5 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/s390x/processor.h
 create mode 100644 tools/testing/selftests/kvm/lib/s390x/processor.c
 create mode 100644 tools/testing/selftests/kvm/s390x/sync_regs_test.c

-- 
2.21.0
