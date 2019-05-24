From: borntraeger at de.ibm.com (Christian Borntraeger)
Date: Fri, 24 May 2019 14:17:41 +0200
Subject: [PATCH v1 0/9] KVM selftests for s390x
In-Reply-To: <0ad63449-c329-f38d-b879-6e427e6a8656@de.ibm.com>
References: <20190523164309.13345-1-thuth@redhat.com>
 <0ad63449-c329-f38d-b879-6e427e6a8656@de.ibm.com>
Message-ID: <e6f953be-00af-756e-4c0a-649294efbd91@de.ibm.com>



On 24.05.19 13:11, Christian Borntraeger wrote:
> I do get
> 
> [10400.440298] kvm-s390: failed to commit memory region
> [10400.508723] kvm-s390: failed to commit memory region
> 
> when running the tests. Will have a look.

It comes from kvm_vm_free. This calls KVM_SET_USER_MEMORY_REGION with size 0,
which the s390 code does not like.
