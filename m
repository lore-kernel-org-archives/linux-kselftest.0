From: thuth at redhat.com (Thomas Huth)
Date: Mon, 20 May 2019 10:08:00 +0200
Subject: [RFC PATCH 1/4] KVM: selftests: Guard struct kvm_vcpu_events with
 __KVM_HAVE_VCPU_EVENTS
In-Reply-To: <e8a57340-6f8d-90b8-ad73-c39c19f5c9a4@de.ibm.com>
References: <20190516111253.4494-1-thuth@redhat.com>
 <20190516111253.4494-2-thuth@redhat.com>
 <e8a57340-6f8d-90b8-ad73-c39c19f5c9a4@de.ibm.com>
Message-ID: <8fda58ac-0e0c-6576-f492-2a9f9d2a3194@redhat.com>

On 20/05/2019 09.12, Christian Borntraeger wrote:
> 
> On 16.05.19 13:12, Thomas Huth wrote:
>> The struct kvm_vcpu_events code is only available on certain architectures
>> (arm, arm64 and x86). To be able to compile kvm_util.c also for other
>> architectures, we've got to fence the code with __KVM_HAVE_VCPU_EVENTS.
>>
>> Signed-off-by: Thomas Huth <thuth at redhat.com>
> Acked-by: Christian Borntraeger <borntraeger at de.ibm.com>
> 
> According to the MAINTAINERS patches, you want me to pick these patches. Correct?

That would be nice, yes. But if you don't want to be responsible for
s390x-related KVM selftest patches, please let me know, then I'll drop
these hunks from the patches again.

 Thomas
