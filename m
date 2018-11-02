From: cyphar at cyphar.com (Aleksa Sarai)
Date: Fri, 2 Nov 2018 17:59:32 +1100
Subject: [PATCH v3 1/2] kretprobe: produce sane stack traces
In-Reply-To: <20181102050509.tw3dhvj5urudvtjl@yavin>
References: <20181101083551.3805-1-cyphar@cyphar.com>
 <20181101083551.3805-2-cyphar@cyphar.com>
 <20181101204720.6ed3fe37@vmware.local.home>
 <20181102050509.tw3dhvj5urudvtjl@yavin>
Message-ID: <20181102065932.bdt4pubbrkvql4mp@yavin>

On 2018-11-02, Aleksa Sarai <cyphar at cyphar.com> wrote:
> For kretprobes I think it would be fairly easy to reconstruct what
> landed you into a kretprobe_trampoline by walking the set of
> kretprobe_instances (since all new ones are added to the head, you can
> get the real return address in-order).
> 
> But I still have to figure out what is actually stopping the
> save_stack_trace() unwinder that isn't stopping the show_stacks()
> unwinder (though the show_stacks() code is more ... liberal with the
> degree of certainty it has about the unwind).

As an aside, I just tested with the frame unwinder and it isn't thrown
off-course by kretprobe_trampoline (though obviously the stack is still
wrong). So I think we just need to hook into the ORC unwinder to get it
to continue skipping up the stack, as well as add the rewriting code for
the stack traces (for all unwinders I guess -- though ideally we should
do this without having to add the same code to every architecture).

-- 
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181102/dd890409/attachment.sig>
