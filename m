Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795638327;
	b=qMGUu6tM9cFm8rktVGU5L0sbauYc2iOuRa0Pm+J2RGSdBdT1Z7k9BN0WnonkfG1yKfeS
	 Oy/OMxK+Fn6zUYzAkRXFJYSruhWXhuo4zMYf9POv3CpCOR16McLv9vK9xR9PfTdWaHgrY
	 2AX+5Vpgv1iRhZubwUo6ZgVc88h/UdFRBrh/9oFa8YBYkpAKamJiDa8ozxL0u5odK9r/H
	 iKBdrlupHtNZFVW11w4cpbrQE6vvTibovLBwTiRkgRW/GFFYHlYY2plU6n6BHx4mTGjHs
	 gA5huD8ud2PS+1CZCuhkJsqiJVhI2RMkUOYXQC4mo9i2FFXtZT6wM2pji7It2nqH9rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iLkN+MWQxnheW7WlW33tdTgTSE87b9Cd5EByIUSUt0Y=;
	b=ze4GNjne3jeLf6kvTLXec1zcSdxszkw0tGiKX4crfqUNISggqgldry8liXSX45dMQ1vM
	 J8I18je7IydPZ7KGdpByDLwcksHrGoED0nGOZ0cOvcZ5LIE7rBvnYBynlrP+zNNRvcyXu
	 XCLVrjujl345Mxfx1BIC2tgbEGsHTvb8HVmUsrOfR/5nQO5yGEioFd1fOmJVf4o8dQd8X
	 ecfbtWFMH2WCIU8fGGwPXTCCKUUOISS53aqB3D8wPZXNucz5X46XsdG1DMQ9oALHpwzSe
	 8tQ6oto5KqDCoExpQtdH1L5Nl4ewql2jHX6D3sbsMq9vTXhpD84DW8psPqMDuatCaGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGTkEe60;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61E1606A338
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 20:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E61E1606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGTkEe60
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a358881793so3283545f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 12:25:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795638325; cv=none;
        d=google.com; s=arc-20260327;
        b=cVKmSwHtKo0niDm1wI1Qxlg45NORXwblWZXRW0ne/77dCzK+B/fOl10rea7/QKAwmO
         fKlXksiHren2Mfl6DfJJNRKwbjP5g1AQUk9NfTQUGa1bvzY7gwKfAO+bVn8qZZWNqcez
         sbnuAz6k3HZKNT39BxjXUmwJhOjI9nQtgCcQjht7KiAveYAwEl/snHD30cdgOLiKA68K
         41DVgjc8h89lehCB6B775RQYI4lUAX8H0j61h3PsFFrEm80vrR5mFoLe3y7f+uEXRZWM
         TEOs9O9A7U197zXEhC3YcSsjO+BRm5Hf91/OO6pj+Hq8V2SydlCMCf1sX/ZRx+TzJfMd
         21rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iLkN+MWQxnheW7WlW33tdTgTSE87b9Cd5EByIUSUt0Y=;
        fh=Pc7kPrHTT709t2vZsf0/aQvns96PyX4RsSerI25dk3U=;
        b=W7YflVICQin7Dc3biwzFiKErXGdgMlPEzfccVzXJuy+ri8Au4fgwLuZIifNaJ31Gmt
         QsJ5WJD13LY8YD0n1k4Gi6gfM4kZLWNd8ObVSabRJs9Npx+dieiCGmhUxamHf0Zs9aZN
         AGuYhTNLK6xwLq2G5aK2M3QQep5U2V/PLiy0t++wQJ6sSfcv41j1ta5zmf+wsMHf7zJn
         t9GjevCQrHycu7Eq3lzhh3G6IJ41ObrZpKvpGHfmyQ9+KFivzaJACOGNJtt6Q26W5Hxg
         maouln3EQcnkwiaN2tUpmDNfGi0phxC+/KtJrbBzop2qkJm4WCiaEjmG1ACZaQCIFoJN
         I8Rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795638325; x=1796243125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iLkN+MWQxnheW7WlW33tdTgTSE87b9Cd5EByIUSUt0Y=;
        b=VGTkEe60t+uBwP6aPNkx43z8z6QVDU++15cRElqDwWfUU1e3fenr6BMJd5yqV3dDA9
         eA8oe5NrXkEHwUBl11jkg8wDy9tp6iawyGZI+I0+8a2wm/AuGn7WAhBNnP2di4ncRBvi
         GP3YhRSf4B9UmdV7WIelY3jLTHdu0tTd4bRuWc/VAf3Fh8E191oj8H4DZfnmEdqvuSvf
         lvk5witmPseoMyw5ddMdhJcD0iLXJtwNtHf9gbVkgQ0gxiXToJG0KG+IUwwsY4py2sxa
         ccRb9lzGiloOKwBt5gcRe4juUs/njCMJygqqqKLSHmyPKP/n+m05YI4EMSm+xl9SMO+n
         fT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638325; x=1796243125;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLkN+MWQxnheW7WlW33tdTgTSE87b9Cd5EByIUSUt0Y=;
        b=i44/D3Maxx5aqHm96rZi4CKYz0/MZEh8b87HgFpO0R426rCaf7SvYq+WUoYrKl95RS
         2WgwKnhDWIWbH8WuqaRMEOHgnGmK+Qg/e9qwQEykWBe/GzAyzva1Fzm4BlMSWoCmKQi0
         xLGZ/VXW4Z/fd9PEXkH/CTzx/px7JmsnGmaVu3MQHtek0cO71QWS5uFzzVW0Hl/IcGV+
         u6ZUIBeMUJ6d5ZDg4Y6kdI0JNFUuEbQ5FLvEVMBs/sjULHLWdo+unewLNR1ujICZqo5h
         uVeW3OVWXJhjoK7zh0eZiucdGhZt+oDF+hRDsofTq27+iIQ6Z6u1gAC+f7XM5Phpyu5t
         I3FQ==
X-Forwarded-Encrypted: i=1; AL+hErFHrnOU3T/g9le1h37b+OeIcbrEOFgVsmVtrIJtoBzO6MN+Bp7np3ssnqNxhDCARLz1b+Ds9D/h/XdBMUCUkF0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sncq6wX7DDxOKDjT+JtqDxzubkoJBkO2PKpU9JO8y2GFSY1g9
	JuGcCyXWpU/ikBoP3fjvPqcc15lPH1KXRd1wwjQ51Pw9hQ5gxRYKgGJbzwjYS5jNuTeF/LWdY4v
	+h3HH3MmfuY/UhSDLsIj5Kov7kFDO6r8=
X-Gm-Gg: AZFdTZfYn1GlF5kZI/SMVLmRWccNE3ueH/3saVZP0+j0PxQ1yny+1ikX3NJFJ/TAtS2
	7jOnY2uKVfO2HjqHPcGzx2UauGO7CAG7jlQHkXtDIG4a/o6DDDQ/GfFJdaj54SRj5qw6k11SMsT
	dNi9cgq8P4jmIw+jyE77/u/8uvPQFmzKG7Z2j7ujMSKiXN0OxY8EMj3pzQAzcjYPGsu5rKzpZzu
	QcGFWUQgu4AKMZ33xwMki1KSX/obzFgu64I2BkiaRR4PTbZBoQ/OJTTzMoMjlQeLPOKd4cMc7wv
	7FeNeHojxItfCaLazDXMESpf5qYM2bW1JDx8JANtmn+q5hHM5oJcyc0swEwaI7ufnWgVTcd0u2J
	nfCRRy7a+nqyUneGTm/2vbLxwMiNQ7T6VHjgzLyCiue/Lw8C0C4Zl/g6DdosvOt8YQwpFn8aaTX
	exrMdl4U0H0lz8jD14DAWo7vNXgzEzDJWPFkg/L0A=
X-Received: by 2002:a05:600c:46cc:b0:4bb:6f41:399f with SMTP id
 5b1f17b1804b1-4bb888236a3mr398384805e9.24.1795638325248; Wed, 25 Nov 2026
 12:25:25 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com> <20261113221248.3535369-19-wusamuel@google.com>
In-Reply-To: <20261113221248.3535369-19-wusamuel@google.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 25 Nov 2026 12:25:13 -0800
X-Gm-Features: Aa3M54rCmMPBEx135c6vF9MhBqdEKKVbA2tVr-knpTqUbo_Og9Fm0v--QDk1gek
Message-ID: <CAEf4Bza48tGhcUhFRhSSv3qijV0uF8YrAQcLM6Qv9az-8zvK_Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 8/9] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY_BY_NAME ioctl
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>, David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 2:14=E2=80=AFPM Samuel Wu <wusamuel@google.com> wro=
te:
>
> libbpf parses all of /proc/kallsyms to resolve typeless ksyms.
>
> Use KALLSYMS_QUERY_BY_NAME instead: exact names, plus "<name>.llvm."
> prefix matches. Ambiguous matches at different addresses fail the load.
> A missing strong extern still fails and a missing weak extern is 0,
> without a text scan.
>
> On any other error (e.g. -ENOTTY on older kernels, or -EPERM), fall back
> to the text parser.
>
> Signed-off-by: Samuel Wu <wusamuel@google.com>
> ---
>  tools/lib/bpf/libbpf.c | 99 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 97 insertions(+), 2 deletions(-)
>
> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> index 44134421bd7d..f3f3475a64d3 100644
> --- a/tools/lib/bpf/libbpf.c
> +++ b/tools/lib/bpf/libbpf.c
> @@ -59,6 +59,34 @@
>  #define BPF_FS_MAGIC           0xcafe4a11
>  #endif
>
> +#ifndef KALLSYMS_QUERY_BY_NAME
> +/* 'f' is PROCFS_IOCTL_MAGIC */
> +#define KALLSYMS_QUERY_BY_NAME _IOC(_IOC_READ | _IOC_WRITE, 'f', 48, 0)
> +
> +enum kallsyms_query_flags {
> +       KALLSYMS_QUERY_NAME_PREFIX =3D 0x01,
> +};
> +
> +struct kallsyms_query_sym {
> +       __u64 sym_addr;
> +       __u64 sym_size;
> +       __u64 sym_name;
> +       __u64 sym_name_len;
> +       __u64 sym_module;
> +       __u64 sym_module_len;
> +};
> +
> +struct kallsyms_query_by_name {
> +       __u64 size;
> +       __u64 query_flags;
> +       __u64 query_name;
> +       __u64 module_filter;
> +       __u64 pos;
> +       __u64 sym;
> +       __u64 sym_struct_size;
> +};
> +#endif
> +

there is no need for this, libbpf in kernel can use kernels' most up
to date UAPI headers directly, and on Github we sync necessary UAPI
headers into include/ directory, so libbpf source code can be built
with latest definitions of kernel UAPI. So you can drop this part

>  #define MAX_EVENT_NAME_LEN     64
>
>  #define BPF_FS_DEFAULT_PATH "/sys/fs/bpf"
> @@ -9421,8 +9449,75 @@ static int kallsyms_cb(unsigned long long sym_addr=
, char sym_type,
>         return 0;
>  }
>
> -static int bpf_object__read_kallsyms_file(struct bpf_object *obj)
> +static int query_ksym_by_name(int fd, struct extern_desc *ext, bool lto_=
prefix)
> +{
> +       struct kallsyms_query_sym sym =3D {};
> +       struct kallsyms_query_by_name q =3D {
> +               .size =3D sizeof(q),
> +               .query_flags =3D lto_prefix ? KALLSYMS_QUERY_NAME_PREFIX =
: 0,
> +               .query_name =3D ptr_to_u64(ext->name),
> +               .sym =3D ptr_to_u64(&sym),
> +               .sym_struct_size =3D sizeof(sym),
> +       };
> +       char prefix_buf[512];
> +       int n;
> +
> +       if (lto_prefix) {
> +               n =3D snprintf(prefix_buf, sizeof(prefix_buf), "%s.llvm."=
, ext->name);
> +               if (n < 0 || n >=3D sizeof(prefix_buf))
> +                       return 0;
> +               q.query_name =3D ptr_to_u64(prefix_buf);
> +       }
> +
> +       while (!ioctl(fd, KALLSYMS_QUERY_BY_NAME, &q)) {
> +               if (!ext->is_set) {
> +                       ext->is_set =3D true;
> +                       ext->ksym.addr =3D sym.sym_addr;
> +                       pr_debug("extern (ksym) '%s': set to 0x%llx\n",
> +                                ext->name, ext->ksym.addr);
> +               } else if (sym.sym_addr !=3D ext->ksym.addr) {
> +                       pr_warn("extern (ksym) '%s': resolution is ambigu=
ous: 0x%llx or 0x%llx\n",
> +                               ext->name, ext->ksym.addr,
> +                               (unsigned long long)sym.sym_addr);
> +                       return -EADDRNOTAVAIL;

I think there is ENOTUNIQ which we can utilize here

> +               }
> +               q.pos++;
> +       }
> +
> +       return errno =3D=3D ENOENT ? 0 : -errno;
> +}
> +
> +static int bpf_object__resolve_typeless_ksyms(struct bpf_object *obj)
>  {
> +       struct extern_desc *ext;
> +       int err =3D 0;
> +       int fd;
> +       int i;
> +
> +       fd =3D open("/proc/kallsyms", O_RDONLY | O_CLOEXEC);
> +       if (fd < 0) {
> +               err =3D -errno;
> +               pr_warn("failed to open /proc/kallsyms: %s\n", errstr(err=
));
> +               return err;
> +       }
> +
> +       for (i =3D 0; i < obj->nr_extern && !err; i++) {
> +               ext =3D &obj->externs[i];
> +               if (ext->type !=3D EXT_KSYM || ext->ksym.type_id)
> +                       continue;
> +
> +               /* Check exact name and then LTO .llvm.<hash> prefix */
> +               err =3D query_ksym_by_name(fd, ext, false);
> +               if (!err)
> +                       err =3D query_ksym_by_name(fd, ext, true);

err =3D err ?: query_ksym_by_name(fd, ext, true /* lto_prefix */);


> +       }
> +       close(fd);
> +       if (!err || err =3D=3D -EADDRNOTAVAIL)
> +               return err;
> +
> +       /* Other errors (e.g. -ENOTTY, -EPERM): parse the text file */
> +       pr_debug("KALLSYMS_QUERY_BY_NAME failed (%s), falling back to /pr=
oc/kallsyms\n",
> +                errstr(err));
>         return libbpf_kallsyms_parse(kallsyms_cb, obj);
>  }
>
> @@ -9699,7 +9794,7 @@ static int bpf_object__resolve_externs(struct bpf_o=
bject *obj,
>                         return -EINVAL;
>         }
>         if (need_kallsyms) {
> -               err =3D bpf_object__read_kallsyms_file(obj);
> +               err =3D bpf_object__resolve_typeless_ksyms(obj);
>                 if (err)
>                         return -EINVAL;
>         }
> --
> 2.56.0.679.gc527c65306-goog
>
