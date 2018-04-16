From: torvalds at linux-foundation.org (Linus Torvalds)
Date: Mon, 16 Apr 2018 11:04:09 -0700
Subject: Linux 4.17-rc1 - kernel paging errors running x86 selftests
In-Reply-To: <8c0a94b7-763d-16be-6401-23a3064ee55a@linux.intel.com>
References: <1dcd116c-9384-6885-2d9e-f620c14bd955@osg.samsung.com>
 <CA+55aFwE1SR87+Xkkmfr+D0Yq3R0HRkdf1GdgScEfXXWN4ba6w@mail.gmail.com>
 <CA+55aFzotCBw7S=dNzyFjZkNqS7MMeKVgUoK6Dgb9gRPV_ywVQ@mail.gmail.com>
 <8c0a94b7-763d-16be-6401-23a3064ee55a@linux.intel.com>
Message-ID: <CA+55aFx=pwEJQHhab3gW6+qdom=ccFoWoK-aZokmqtPxNqTd8g@mail.gmail.com>

On Mon, Apr 16, 2018 at 10:58 AM, Dave Hansen
<dave.hansen at linux.intel.com> wrote:
>
> Joerg just found and fixed something that would be poked by the x86
> selftests:
>
> https://lkml.org/lkml/2018/4/16/230

Yup.

And that silly bug explains the all-ones PTE.

I was going through the bisection, with just a couple more rounds to
go, but I guess I don't even need it.

              Linus
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
