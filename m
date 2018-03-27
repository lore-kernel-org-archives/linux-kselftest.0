From: daniel@iogearbox.net (Daniel Borkmann)
Date: Tue, 27 Mar 2018 11:52:27 +0200
Subject: [PATCH 4/4] selftests/bpf: fix compiling errors
In-Reply-To: <20180327090000.fou6oyvr663lbyuq@intel.com>
References: <1522056208-4004-1-git-send-email-changbin.du@intel.com>
 <1522056208-4004-5-git-send-email-changbin.du@intel.com>
 <20180326145511.lzoi6wja6iht5lvq@ast-mbp.dhcp.thefacebook.com>
 <20180327022010.57u6rn73inbkrycn@intel.com>
 <20180327030229.txifuth2qmnjo3hy@ast-mbp>
 <20180327030613.hkp7hox3g4prnbsg@intel.com>
 <2dd7c04a-eb10-e730-148e-3b04a18e9b44@iogearbox.net>
 <20180327090000.fou6oyvr663lbyuq@intel.com>
Message-ID: <90ce8146-cecd-c928-f9c6-470db97b2051@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180327095227.4NaPT0-LtpYIHL1bCK29gnXRSm3qyjFQsLIpqNlfAi4@z>

On 03/27/2018 11:00 AM, Du, Changbin wrote:
> On Tue, Mar 27, 2018@10:52:57AM +0200, Daniel Borkmann wrote:
>> On 03/27/2018 05:06 AM, Du, Changbin wrote:
>>> On Mon, Mar 26, 2018@08:02:30PM -0700, Alexei Starovoitov wrote:
>>>> On Tue, Mar 27, 2018@10:20:10AM +0800, Du, Changbin wrote:
>>>>> On Mon, Mar 26, 2018@07:55:13AM -0700, Alexei Starovoitov wrote:
>>>>>> On Mon, Mar 26, 2018@05:23:28PM +0800, changbin.du@intel.com wrote:
>>>>>>> Signed-off-by: Changbin Du <changbin.du at intel.com>
>>>>>>> ---
>>>>>>>  tools/testing/selftests/bpf/Makefile | 5 +++--
>>>>>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
>>>>>>> index 5c43c18..dc0fdc8 100644
>>>>>>> --- a/tools/testing/selftests/bpf/Makefile
>>>>>>> +++ b/tools/testing/selftests/bpf/Makefile
>>>>>>> @@ -10,7 +10,8 @@ ifneq ($(wildcard $(GENHDR)),)
>>>>>>>    GENFLAGS := -DHAVE_GENHDR
>>>>>>>  endif
>>>>>>>  
>>>>>>> -CFLAGS += -Wall -O2 -I$(APIDIR) -I$(LIBDIR) -I$(GENDIR) $(GENFLAGS) -I../../../include
>>>>>>> +CFLAGS += -Wall -O2 -I$(APIDIR) -I$(LIBDIR) -I$(GENDIR) $(GENFLAGS) \
>>>>>>> +	  -I../../../include -I../../../../usr/include
>>>>>>>  LDLIBS += -lcap -lelf -lrt -lpthread
>>>>>>>  
>>>>>>>  # Order correspond to 'make run_tests' order
>>>>>>> @@ -62,7 +63,7 @@ else
>>>>>>>    CPU ?= generic
>>>>>>>  endif
>>>>>>>  
>>>>>>> -CLANG_FLAGS = -I. -I./include/uapi -I../../../include/uapi \
>>>>>>> +CLANG_FLAGS = -I. -I./include/uapi -I../../../include/uapi -I../../../../usr/include \
>>>>>>>  	      -Wno-compare-distinct-pointer-types
>>>>>>
>>>>>> Nack.
>>>>>> I suspect that will break the build for everyone else who's doing it in the directory
>>>>>> itself instead of the outer one.
>>>>>
>>>>> This one? But I didn't see any problem.
>>>>
>>>> because the build was lucky and additional path ../../../../usr/include didn't point
>>>> to a valid dir?
>>
>> Agree.
>>
>>> I am sorry but I don't understand why you mean *lucky*. Of cause, the path is valid.
>>
>> The problem is that this suddenly requires users to do a 'make headers_install' in
>> order to populate usr/include/ directory in the first place. While it's annoying
>> enough for BPF samples where this is needed, I absolutely don't want to introduce
>> this for BPF kselftests. It's the wrong approach. Besides, in tools infra, there is
>> a tools/arch/*/include/uapi/asm/bitsperlong.h header copy already, so we really need
>> to use that instead. Please adapt your patch accordingly and respin. Please also Cc
>> us and netdev at vger.kernel.org for BPF kselftests changes.
>>
> Thanks for the explanation. So we expect that tools/arch/*/include is in the searching list, right?
> The corrent makefile seems not. How do you get this built?

E.g. take a look at tools/include/asm/barrier.h or tools/include/uapi/asm/bpf_perf_event.h
just to name two examples. We'd need something similar to this which then points to the
arch specific includes.

Thanks,
Daniel

> changbin at gvt-dell-host:~/work/linux/tools/testing/selftests/bpf$ make -p
> [...]
> clang -I. -I./include/uapi -I../../../include/uapi -Wno-compare-distinct-pointer-types \
>          -O2 -target bpf -emit-llvm -c test_pkt_access.c -o - |      \
> llc -march=bpf -mcpu=generic -filetype=obj -o /home/changbin/work/linux/tools/testing/selftests/bpf/test_pkt_access.o
> In file included from test_pkt_access.c:9:
> In file included from ../../../include/uapi/linux/bpf.h:11:
> In file included from ./include/uapi/linux/types.h:5:
> /usr/include/asm-generic/int-ll64.h:11:10: fatal error: 'asm/bitsperlong.h' file not found
> #include <asm/bitsperlong.h>
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
