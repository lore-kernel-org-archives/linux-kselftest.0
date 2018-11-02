From: cyphar@cyphar.com (Aleksa Sarai)
Date: Fri, 2 Nov 2018 18:58:18 +1100
Subject: [PATCH v3 1/2] kretprobe: produce sane stack traces
In-Reply-To: <20181102050509.tw3dhvj5urudvtjl@yavin>
References: <20181101083551.3805-1-cyphar@cyphar.com>
 <20181101083551.3805-2-cyphar@cyphar.com>
 <20181101204720.6ed3fe37@vmware.local.home>
 <20181102050509.tw3dhvj5urudvtjl@yavin>
Message-ID: <20181102075818.fk55mxb3snqj5rjt@yavin>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181102075818.d4jOXk29fEXGYB0BBdCWsmAJrKwBsLtPkBtxpIucxtI@z>

On 2018-11-02, Aleksa Sarai <cyphar@cyphar.com> wrote:
> Unfortunately, I'm having a lot of trouble understanding how the current
> ftrace hooking works -- ORC has a couple of ftrace hooks that seem
> reasonable on the surface but I don't understand (for instance) how
> HAVE_FUNCTION_GRAPH_RET_ADDR_PTR *actually* works. Though your comment
> appears to indicate that it doesn't work for stack traces?

Sorry, I just figured out how it works! (To make sure I actually
understand -- retp is a pointer to the place in the stack where the
return address is stored, so it uniquely specifies what each trampoline
actually points to -- this trick could also be used for kretprobes).

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
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181102/b68797eb/attachment.sig>
