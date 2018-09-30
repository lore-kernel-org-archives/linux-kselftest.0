From: cyphar@cyphar.com (Aleksa Sarai)
Date: Sun, 30 Sep 2018 14:44:11 +1000
Subject: [PATCH 0/3] namei: implement various scoping AT_* flags
In-Reply-To: <20180929143814.yfo6rud7dkyb5ip4@brauner.io>
References: <20180929103453.12025-1-cyphar@cyphar.com>
 <20180929143814.yfo6rud7dkyb5ip4@brauner.io>
Message-ID: <20180930044411.orcuw7xok4szqzzo@ryuk>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180930044411.RmHeNj9ykFZ33B2t5zVy5sQVvUmkxgPdbxiEIgMWhrc@z>

On 2018-09-29, Christian Brauner <christian@brauner.io> wrote:
> > Currently I've only enabled these for openat(2) and the stat(2) family.
> > I would hope we could enable it for basically every *at(2) syscall --
> > but many of them appear to not have a @flags argument and thus we'll
> > need to add several new syscalls to do this. I'm more than happy to send
> > those patches, but I'd prefer to know that this preliminary work is
> > acceptable before doing a bunch of copy-paste to add new sets of *at(2)
> > syscalls.
> 
> We should really make sure that we can't make due with openat() alone
> before adding a bunch of new syscalls. So there's no need to rush into
> this. :)

Yeah, I think that we could (mostly) make do with openat(2). We might
need to have renameat(2) and a few others, but if we had more support
for AT_EMPTY_PATH you should be able to just O_PATH|O_{BENEATH,XDEV,...}
and then operate on the O_PATH fd.

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
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20180930/c9919dd2/attachment.sig>
