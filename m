From: logang at deltatee.com (Logan Gunthorpe)
Date: Thu, 31 Jan 2019 16:52:10 -0700
Subject: [PATCH 0/9] Support using MSI interrupts in ntb_transport
In-Reply-To: <d46ce09c-d493-3d63-a854-b68a09345a75@intel.com>
References: <20190131185656.17972-1-logang@deltatee.com>
 <345197a6-89e6-c0de-5f7b-a646b5f396c9@intel.com>
 <bafe9db4-6d5b-0453-d7e7-e49e9293dd01@deltatee.com>
 <ea7b7c3c-8ed5-51ec-022a-7d28a5afce82@intel.com>
 <29f7e3fe-5354-6156-1243-7248ffb2249f@deltatee.com>
 <7e3eed52-8e3a-c472-392a-5dc5689290ae@intel.com>
 <5f8b1616-a005-7658-978f-16466fcc3886@deltatee.com>
 <d46ce09c-d493-3d63-a854-b68a09345a75@intel.com>
Message-ID: <59a4f188-0d37-bf40-baf6-80b4fa46df52@deltatee.com>



On 2019-01-31 4:48 p.m., Dave Jiang wrote:
> 
> On 1/31/2019 4:41 PM, Logan Gunthorpe wrote:
>>
>> On 2019-01-31 3:46 p.m., Dave Jiang wrote:
>>> I believe irqbalance writes to the file /proc/irq/N/smp_affinity. So
>>> maybe take a look at the code that starts from there and see if it would
>>> have any impact on your stuff.
>> Ok, well on my system I can write to the smp_affinity all day and the
>> MSI interrupts still work fine.
> 
> Maybe your code is ok then. If the stats show up in /proc/interrupts 
> then you can see it moving to different cores.

Yes, I did check that the stats change CPU in proc interrupts.

> Yeah I'm not sure what to do about it either as I'm not super familiar 
> with that area either. Just making note of what I encountered. And you 
> are right, the updated info has to go over NTB for the other side to 
> write to the updated place. So there's a lot of latency involved.

Ok, well I'll implement the callback anyway for v2. Better safe than
sorry. We can operate on the assumption that someone thought of the race
condition and if we ever see reports of lost interrupts we'll know where
to look.

Logan
