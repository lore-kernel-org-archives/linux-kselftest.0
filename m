From: torvalds at linux-foundation.org (Linus Torvalds)
Date: Mon, 16 Apr 2018 11:15:51 -0700
Subject: Linux 4.17-rc1 - kernel paging errors running x86 selftests
In-Reply-To: <CA+55aFx=pwEJQHhab3gW6+qdom=ccFoWoK-aZokmqtPxNqTd8g@mail.gmail.com>
References: <1dcd116c-9384-6885-2d9e-f620c14bd955@osg.samsung.com>
 <CA+55aFwE1SR87+Xkkmfr+D0Yq3R0HRkdf1GdgScEfXXWN4ba6w@mail.gmail.com>
 <CA+55aFzotCBw7S=dNzyFjZkNqS7MMeKVgUoK6Dgb9gRPV_ywVQ@mail.gmail.com>
 <8c0a94b7-763d-16be-6401-23a3064ee55a@linux.intel.com>
 <CA+55aFx=pwEJQHhab3gW6+qdom=ccFoWoK-aZokmqtPxNqTd8g@mail.gmail.com>
Message-ID: <CA+55aFwBT7xEKxoVEEgT3vjg960Tpx+CJo+4238P66Q7w-nM-Q@mail.gmail.com>

On Mon, Apr 16, 2018 at 11:04 AM, Linus Torvalds
<torvalds at linux-foundation.org> wrote:
>
> I was going through the bisection, with just a couple more rounds to
> go, but I guess I don't even need it.

Ingo/Thomas: I will be just taking this directly, since it's so
trivial and obvious and I got cc'd on the discussion.

                    Linus
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
