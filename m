From: yhs at fb.com (Yonghong Song)
Date: Wed, 24 Apr 2019 22:56:56 +0000
Subject: [PATCH bpf-next v4 5/5] selftests: bpf: test writable buffers in
 raw tps
In-Reply-To: <20190424190721.24453-6-mmullins@fb.com>
References: <20190424190721.24453-1-mmullins@fb.com>
 <20190424190721.24453-6-mmullins@fb.com>
Message-ID: <0844db66-24e8-aaf8-9b86-467417f40241@fb.com>



On 4/24/19 12:07 PM, Matt Mullins wrote:
> This tests that:
>    * a BPF_PROG_TYPE_RAW_TRACEPOINT_WRITABLE cannot be attached if it
>      uses either:
>      * a variable offset to the tracepoint buffer, or
>      * an offset beyond the size of the tracepoint buffer
>    * a tracer can modify the buffer provided when attached to a writable
>      tracepoint in bpf_prog_test_run
> 
> Signed-off-by: Matt Mullins <mmullins at fb.com>

Acked-by: Yonghong Song <yhs at fb.com>

BTW, your patches have some conflicts with latest bpf-next, you may want
to rebase and resubmit.
