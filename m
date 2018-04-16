From: dave.hansen@linux.intel.com (Dave Hansen)
Date: Mon, 16 Apr 2018 10:58:58 -0700
Subject: Linux 4.17-rc1 - kernel paging errors running x86 selftests
In-Reply-To: <CA+55aFzotCBw7S=dNzyFjZkNqS7MMeKVgUoK6Dgb9gRPV_ywVQ@mail.gmail.com>
References: <1dcd116c-9384-6885-2d9e-f620c14bd955@osg.samsung.com>
 <CA+55aFwE1SR87+Xkkmfr+D0Yq3R0HRkdf1GdgScEfXXWN4ba6w@mail.gmail.com>
 <CA+55aFzotCBw7S=dNzyFjZkNqS7MMeKVgUoK6Dgb9gRPV_ywVQ@mail.gmail.com>
Message-ID: <8c0a94b7-763d-16be-6401-23a3064ee55a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180416175858.96EY4MdE4y8Pd3o0T-wxalQFRakwzeY_qq2bp9rm3O0@z>

On 04/16/2018 10:56 AM, Linus Torvalds wrote:
> On Mon, Apr 16, 2018 at 10:43 AM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> I don't see *why* it would be badly set up, and that test works fine
>> for me, though.
> 
> AHHAH!
> 
> I'm wrong. I can see it too. My desktop was running 18b7fd1c93e5 (my
> kernel from Saturday, I hadn't rebooted it since), but I had 4.17-rc1
> in kvmtool and on my laptop, and I see the problem in both cases.
> 
> So this came in recently, and I bet it's the global pages series from
> Dave Hansen, although there were a few other things that came in
> during the last day.

Joerg just found and fixed something that would be poked by the x86
selftests:

https://lkml.org/lkml/2018/4/16/230
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
