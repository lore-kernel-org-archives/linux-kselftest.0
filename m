From: yhs at fb.com (Yonghong Song)
Date: Mon, 22 Apr 2019 21:13:06 +0000
Subject: [PATCH bpf-next v3 5/5] selftests: bpf: test writable buffers in
 raw tps
In-Reply-To: <7a40c2851cd6f708a11cd003a05ab79c8644b10d.camel@fb.com>
References: <20190419210409.5021-1-mmullins@fb.com>
 <20190419210409.5021-6-mmullins@fb.com>
 <7f32dd3c-a1e1-2965-3a98-3fa9e54e8501@fb.com>
 <7a40c2851cd6f708a11cd003a05ab79c8644b10d.camel@fb.com>
Message-ID: <7a82ca1d-dc92-cd03-0dff-3329d8f11774@fb.com>



On 4/22/19 12:27 PM, Matt Mullins wrote:
> On Mon, 2019-04-22 at 18:32 +0000, Yonghong Song wrote:
>>
>> On 4/19/19 2:04 PM, Matt Mullins wrote:
>>> This tests that:
>>>     * a BPF_PROG_TYPE_RAW_TRACEPOINT_WRITABLE cannot be attached if it
>>>       uses either:
>>>       * a variable offset to the tracepoint buffer, or
>>>       * an offset beyond the size of the tracepoint buffer
>>>     * a tracer can modify the buffer provided when attached to a writable
>>>       tracepoint in bpf_prog_test_run
>>>
>>> Signed-off-by: Matt Mullins <mmullins at fb.com>
>>> ---
>>>    include/trace/events/bpf_test_run.h           | 50 ++++++++++++
>>>    net/bpf/test_run.c                            |  4 +
>>>    .../raw_tp_writable_reject_nbd_invalid.c      | 40 ++++++++++
>>>    .../bpf/prog_tests/raw_tp_writable_test_run.c | 80 +++++++++++++++++++
>>>    .../selftests/bpf/verifier/raw_tp_writable.c  | 34 ++++++++
>>>    5 files changed, 208 insertions(+)
>>>    create mode 100644 include/trace/events/bpf_test_run.h
>>>    create mode 100644 tools/testing/selftests/bpf/prog_tests/raw_tp_writable_reject_nbd_invalid.c
>>>    create mode 100644 tools/testing/selftests/bpf/prog_tests/raw_tp_writable_test_run.c
>>>    create mode 100644 tools/testing/selftests/bpf/verifier/raw_tp_writable.c
>>>
>>> diff --git a/include/trace/events/bpf_test_run.h b/include/trace/events/bpf_test_run.h
>>> new file mode 100644
>>> index 000000000000..abf466839ea4
>>> --- /dev/null
>>> +++ b/include/trace/events/bpf_test_run.h
>>> @@ -0,0 +1,50 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +#undef TRACE_SYSTEM
>>> +#define TRACE_SYSTEM bpf_test_run
>>> +
>>> +#if !defined(_TRACE_NBD_H) || defined(TRACE_HEADER_MULTI_READ)
>>> +#define _TRACE_BPF_TEST_RUN_H
>>> +
>>> +#include <linux/tracepoint.h>
>>> +
>>> +DECLARE_EVENT_CLASS(bpf_test_finish,
>>> +
>>> +	TP_PROTO(int *err),
>>> +
>>> +	TP_ARGS(err),
>>> +
>>> +	TP_STRUCT__entry(
>>> +		__field(int, err)
>>> +	),
>>> +
>>> +	TP_fast_assign(
>>> +		__entry->err = *err;
>>> +	),
>>> +
>>> +	TP_printk("bpf_test_finish with err=%d", __entry->err)
>>> +);
>>> +
>>> +#ifdef DEFINE_EVENT_WRITABLE
>>> +#undef BPF_TEST_RUN_DEFINE_EVENT
>>> +#define BPF_TEST_RUN_DEFINE_EVENT(template, call, proto, args, size)	\
>>> +	DEFINE_EVENT_WRITABLE(template, call, PARAMS(proto),		\
>>> +			      PARAMS(args), size)
>>> +#else
>>> +#undef BPF_TEST_RUN_DEFINE_EVENT
>>> +#define BPF_TEST_RUN_DEFINE_EVENT(template, call, proto, args, size)	\
>>> +	DEFINE_EVENT(template, call, PARAMS(proto), PARAMS(args))
>>> +#endif
>>> +
>>> +BPF_TEST_RUN_DEFINE_EVENT(bpf_test_finish, bpf_test_finish,
>>> +
>>> +	TP_PROTO(int *err),
>>> +
>>> +	TP_ARGS(err),
>>> +
>>> +	sizeof(int)
>>> +);
>>> +
>>> +#endif
>>> +
>>> +/* This part must be outside protection */
>>> +#include <trace/define_trace.h>
>>> diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
>>> index fab142b796ef..25e757102595 100644
>>> --- a/net/bpf/test_run.c
>>> +++ b/net/bpf/test_run.c
>>> @@ -13,6 +13,9 @@
>>>    #include <net/sock.h>
>>>    #include <net/tcp.h>
>>>    
>>> +#define CREATE_TRACE_POINTS
>>> +#include <trace/events/bpf_test_run.h>
>>> +
>>>    static int bpf_test_run(struct bpf_prog *prog, void *ctx, u32 repeat,
>>>    			u32 *retval, u32 *time)
>>>    {
>>> @@ -100,6 +103,7 @@ static int bpf_test_finish(const union bpf_attr *kattr,
>>>    	if (err != -ENOSPC)
>>>    		err = 0;
>>>    out:
>>> +	trace_bpf_test_finish(&err);
>>>    	return err;
>>>    }
>>>    
>>> diff --git a/tools/testing/selftests/bpf/prog_tests/raw_tp_writable_reject_nbd_invalid.c b/tools/testing/selftests/bpf/prog_tests/raw_tp_writable_reject_nbd_invalid.c
>>> new file mode 100644
>>> index 000000000000..328d5c4b084b
>>> --- /dev/null
>>> +++ b/tools/testing/selftests/bpf/prog_tests/raw_tp_writable_reject_nbd_invalid.c
>>> @@ -0,0 +1,40 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +#include <test_progs.h>
>>> +#include <linux/nbd.h>
>>> +
>>> +void test_raw_tp_writable_reject_nbd_invalid(void)
>>> +{
>>> +	__u32 duration = 0;
>>> +	char error[4096];
>>> +	int bpf_fd = -1, tp_fd = -1;
>>> +
>>> +	const struct bpf_insn program[] = {
>>> +		/* r6 is our tp buffer */
>>> +		BPF_LDX_MEM(BPF_DW, BPF_REG_6, BPF_REG_1, 0),
>>> +		BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_6, 128),
>>
>> The number "128" is a little cryptic. Maybe you can use something like
>> sizeof(struct nbd_request)?
> 
> That was explicitly chosen to be (far) larger than an nbd_request, as
> this program should be rejected by the verifier.  If you really want, I
> can do `sizeof(struct nbd_request) + some constant` and add a comment.
> But the size of an nbd request should never change, as that's a network
> protocol.

I think `sizeof(struct nbd_request) + some constant` is better than 
number `128`.
