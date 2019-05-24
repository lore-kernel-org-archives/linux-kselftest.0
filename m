From: david at redhat.com (David Hildenbrand)
Date: Fri, 24 May 2019 14:36:24 +0200
Subject: [PATCH v1 0/9] KVM selftests for s390x
In-Reply-To: <411d4ad9-b43e-d3ae-1b66-65888c894caa@de.ibm.com>
References: <20190523164309.13345-1-thuth@redhat.com>
 <0ad63449-c329-f38d-b879-6e427e6a8656@de.ibm.com>
 <e6f953be-00af-756e-4c0a-649294efbd91@de.ibm.com>
 <411d4ad9-b43e-d3ae-1b66-65888c894caa@de.ibm.com>
Message-ID: <e2f1f36b-51b6-30f3-cee5-950b72b6fa67@redhat.com>

On 24.05.19 14:29, Christian Borntraeger wrote:
> 
> 
> On 24.05.19 14:17, Christian Borntraeger wrote:
>>
>>
>> On 24.05.19 13:11, Christian Borntraeger wrote:
>>> I do get
>>>
>>> [10400.440298] kvm-s390: failed to commit memory region
>>> [10400.508723] kvm-s390: failed to commit memory region
>>>
>>> when running the tests. Will have a look.
>>
>> It comes from kvm_vm_free. This calls KVM_SET_USER_MEMORY_REGION with size 0,
>> which the s390 code does not like.
>>
> 
> The doc says about  KVM_SET_USER_MEMORY_REGION:
> 
> This ioctl allows the user to create or modify a guest physical memory
> slot.  When changing an existing slot, it may be moved in the guest
> physical memory space, or its flags may be modified.  --> It may not be
> resized. <----

Size 0 is deleting, not resizing AFAIK.


-- 

Thanks,

David / dhildenb
