From: cyphar@cyphar.com (Aleksa Sarai)
Date: Sun, 30 Sep 2018 14:38:23 +1000
Subject: [PATCH 1/3] namei: implement O_BENEATH-style AT_* flags
In-Reply-To: <20180929103453.12025-2-cyphar@cyphar.com>
References: <20180929103453.12025-1-cyphar@cyphar.com>
 <20180929103453.12025-2-cyphar@cyphar.com>
Message-ID: <20180930043823.2pgzrtgcziaou7ov@ryuk>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180930043823.H-Ila5Tst9-2Tw_tz5QLvLl47Ub33FW0ykUhSLtQ32I@z>

On 2018-09-29, Aleksa Sarai <cyphar@cyphar.com> wrote:
> * AT_XDEV: Disallow mount-point crossing (both *down* into one, or *up*
>   from one). The primary "scoping" use is to blocking resolution that
>   crosses a bind-mount, which has a similar property to a symlink (in
>   the way that it allows for escape from the starting-point). Since it
>   is not possible to differentiate bind-mounts However since
>   bind-mounting requires privileges (in ways symlinks don't) this has
>   been split from LOOKUP_BENEATH. The naming is based on "find -xdev"
>   (though find(1) doesn't walk upwards, the semantics seem obvious).

I've just noticed that the mountpoint-crossing code for AT_XDEV doesn't
detect things like:

   % ln -s / /tmp/jumpup
   % vfs_helper -o open -F xdev -d /tmp jumpup
   /

I will fix that in v2.

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
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20180930/71e10012/attachment.sig>
