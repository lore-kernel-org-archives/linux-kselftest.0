From: thuth at redhat.com (Thomas Huth)
Date: Thu, 23 May 2019 18:43:01 +0200
Subject: [PATCH 1/9] KVM: selftests: Wrap vcpu_nested_state_get/set functions
 with x86 guard
In-Reply-To: <20190523164309.13345-1-thuth@redhat.com>
References: <20190523164309.13345-1-thuth@redhat.com>
Message-ID: <20190523164309.13345-2-thuth@redhat.com>

struct kvm_nested_state is only available on x86 so far. To be able
to compile the code on other architectures as well, we need to wrap
the related code with #ifdefs.

Reviewed-by: Andrew Jones <drjones at redhat.com>
Signed-off-by: Thomas Huth <thuth at redhat.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 2 ++
 tools/testing/selftests/kvm/lib/kvm_util.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 8c6b9619797d..a5a4b28f14d8 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -118,10 +118,12 @@ void vcpu_events_get(struct kvm_vm *vm, uint32_t vcpuid,
 		     struct kvm_vcpu_events *events);
 void vcpu_events_set(struct kvm_vm *vm, uint32_t vcpuid,
 		     struct kvm_vcpu_events *events);
+#ifdef __x86_64__
 void vcpu_nested_state_get(struct kvm_vm *vm, uint32_t vcpuid,
 			   struct kvm_nested_state *state);
 int vcpu_nested_state_set(struct kvm_vm *vm, uint32_t vcpuid,
 			  struct kvm_nested_state *state, bool ignore_error);
+#endif
 
 const char *exit_reason_str(unsigned int exit_reason);
 
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index e9113857f44e..ba1359ac504f 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1250,6 +1250,7 @@ void vcpu_events_set(struct kvm_vm *vm, uint32_t vcpuid,
 		ret, errno);
 }
 
+#ifdef __x86_64__
 void vcpu_nested_state_get(struct kvm_vm *vm, uint32_t vcpuid,
 			   struct kvm_nested_state *state)
 {
@@ -1281,6 +1282,7 @@ int vcpu_nested_state_set(struct kvm_vm *vm, uint32_t vcpuid,
 
 	return ret;
 }
+#endif
 
 /*
  * VM VCPU System Regs Get
-- 
2.21.0
