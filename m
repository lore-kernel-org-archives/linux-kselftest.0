Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1314B95CC
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 15:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348714; cv=pass; b=SkLSQZn0QAILC7HZh444xHSJgo7XILtiZeWYm0DbijpGmwWQAwNf1Aan6Zwj2zz4lZ5WakE8q98NxG8wIoegt5LdnJl/n572ER7lWEfM4JSY8czGbWvdYCdHx5vIIZvgzvb9oGxVT9q1ieKkbDJmF1H8B1V5B/VaU4cPADKLC+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348714; c=relaxed/simple;
	bh=WAWqhJNmyo51Od5KW8SJ0vK6DSlgvw2LcK3VD7saVMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tR+yFZycE3sVqc8Pfw7BSG+qpmURLCFxqR9cSTu1/WrO0H8iW7yoLqCEBlzJkiU8lL8JdVi+/OxKyZTr93M63LIF8i1Q/61y+xMNyh7o2u8n4wxum3BwciUgCvMYuCdyf4lKn7L2XK2a5VxchYqGEFLlxVwMQ1IqJkDcKjtWwxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjQmcmay; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjQmcmay"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so1648375a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 08:05:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790348700; cv=none;
        d=google.com; s=arc-20260327;
        b=cDAtlu/YIggJFULa++mYWfu/r3pQ9IpwxjlqrlVm4EVukbqMzkgbiMNkHQXKWEZw6E
         we7NKtfkd/JL8axrZdo6ZN/CBdhMW9fxL9LWFmmw7fus9qDo1IjoWFUNwRMIzLxy+DhM
         UhSb8m0mFQ0MJ1L/LyoVHbkuW8rZEk9MVaIoGOLVMDQ6Df1B8AP3lUfUK/RrCc2yasSF
         olYcy81eU+Ta1bi8MU9UTyqzseAXWwKo8EQNngmgwFhREtSODDZYlv3mSr9Bc9xEUFVL
         eFWiDmQYUosaQRRWJavXGTFyTKhpH6iEqKEMNwmxqAm9s6+f0pQE+TIQf94IFXyK4Ih6
         Ba9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x6h1BVvc6NlZ/1f8ypPzy3ocqWyFlnaev/ls/pKUnb8=;
        fh=PSAgxpgPMW4UKFvfmxa48uaxHUmiwhUah8R0oxTJZ4k=;
        b=nXemGCkXAmv8zcVUBGT0X+pmWNfFuH9tXI9lOjfEV+XqPzzCBxSRVM8jbAk57kPNOY
         0RH7q5qTU19s8S4ES3cxqBENpmutjj14MHYusd9mjmI0VouwKHYuVb7NHSgYpnEgGe6p
         1MixdQHb9u26igcVUwRgd++N9RiVGwc5a1UphTKwjwS2GfejCAFLRx8nXqKKeLq+rsyL
         6GB1asuodLjmngAh3JohxQkQ1Xp36GiGhqjXU67bK48/r2Bt4tQxwYJUxvo0fmK1pJ5o
         oLS0tr706jYejSC1ptruhxab/7+e/A2NIIVODXWqc8Zjxv5ObsNya6ZmrRBBaDXGRVRV
         3XAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790348700; x=1790953500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6h1BVvc6NlZ/1f8ypPzy3ocqWyFlnaev/ls/pKUnb8=;
        b=EjQmcmayCVkHHRheUxRBMKhMGxjjSG3w9P62Mo/R5MrPRDrQ7AtdMFociIibDGvO9Y
         lTB8UjLcG90to0VIOsJSOyoOgbWhm8Jbl+3FqPP9uTzEgkKEZYXB9omRzSLOh2VWnB4/
         qVgnSgh3i7vc7m5ApBRXVzyfjoPU3TyNN1n6FVxFwVvDlP2fuG/OrjI4av6aOZQjJtHn
         V+p8BP9VmGllwqsx5kUqGHzDNSdHR08aCI7+UrpTMTRPtFfA2v0nSFxeG4VcrcwVtdHv
         iW6tD0qxn+tsWfoGbU/gUPDrWnWDkUMFI17wxrWnFFU8M1RRzO0K+CINdoJpjohcIITP
         gG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790348700; x=1790953500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6h1BVvc6NlZ/1f8ypPzy3ocqWyFlnaev/ls/pKUnb8=;
        b=Hh7ZX1ZxSXS95BsvUEYL0YhKwePT9E12+OMOEAIS60tRzJQNDlRXfPdNnDWU8tl0fq
         NfBlGouMciyKmL5jvWMwqncCloUJEGiFiheESJ/GbgpWFpsUObREaLAjmcjSBnnRkJMn
         uSw7yc1uZ0Oo11y6OZ52QdxnqHcSx2TeNEhA8ybcsJgwIsIqXTLa+HCnKvV4Dnw1HFuJ
         HeIqXX1oEiF+vqP34LGNfeGBx9781Ie978qcAIN/CWhFr7hBYbw7RuyU3wzfGr+oZZPw
         XNUF1l9MQHn1h/vBjLiQN4Bx/S/lA/IXRAb5lFBxf7LQiyYuy+K2fbpxfuwjWXmTQ9iH
         rBZg==
X-Forwarded-Encrypted: i=1; AKwUvBxTnjHVtMHKhO87rqMCebCJ4TCExLz7U8LJtU5x4P41J0peocYRkz/P/Bkqi01kT/yCPOStgJLkwm5FC9bANek=@vger.kernel.org
X-Gm-Message-State: AFuF++ktRR7hCDnLgUOwjVzLctFItSbNt8JsmxJsi+GvXkgdGUKwoGMA
	2zYCI7s/1BkPwzUDQhwzzDqXtnjnfQvTwoKTLr1JCkURHcMUArd6Lol5+djejOTQ2i0LXppMJju
	Q74XOj3HnY0V1bqB5rwGI5EpOgR24mo4=
X-Gm-Gg: AYBFou1vU1GwcmLoScQKAEvbOh1y4RVtKKh8HA0/0+/0W58vyFDEyqgNIrZS683Av91
	Q7FJ4s9iFxV+u7bPfz4zSf7xQIOKsHZI1z8LXmK92apVH5PrBgJPbBibiLW7l9LCTgIER2dlRRf
	f9Nf0qQe5l2YX6S8PzasbroCPvJXfTPMgGmwhXMHFqrdDJqiokvZWH6LXcqjYY/zL264gcoN45x
	nsw3S+dcx3HS8E5GySV7D3FQsycFN+m4ISMuDCAsReZhgsAVP5iweddIU7e0uHTq5J26wt9nIcB
	gJFM2d28Z+//vtw91DtwzkdcxLbrf79Z/FN/SLLmx2h+7qywfdZb3wxYgg==
X-Received: by 2002:a05:6402:304f:b0:698:c13e:179a with SMTP id
 4fb4d7f45d1cf-6aac8f0fb76mr4307366a12.10.1790348699463; Fri, 25 Sep 2026
 08:04:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924112858.51392-1-disgoel@linux.ibm.com>
In-Reply-To: <20260924112858.51392-1-disgoel@linux.ibm.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 25 Sep 2026 17:04:48 +0200
X-Gm-Features: AclHuK99bcpAkghS0fUG2lImCTNfTZaz5pVDj1Ros9PGZp_xBJVRQl4OTsgjcsA
Message-ID: <CAOQ4uxh+VbTTUTQxRZ6jxYCLyBedKEPOQAPEkrJwhbiL32eGPg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ovl: fix mount setup failing when override_creds
 drops CAP_SYS_ADMIN
To: Disha Goel <disgoel@linux.ibm.com>, Christian Brauner <brauner@kernel.org>
Cc: miklos@szeredi.hu, viro@zeniv.linux.org.uk, jack@suse.cz, shuah@kernel.org, 
	linux-unionfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 1:29=E2=80=AFPM Disha Goel <disgoel@linux.ibm.com> =
wrote:
>
> When a process drops CAP_SYS_ADMIN and calls fsconfig(FSCONFIG_SET_FLAG,
> "override_creds"), overlayfs saves those restricted credentials in
> ofs->creator_cred.  ovl_fill_super() then wrapped the entire mount setup
> in with_ovl_creds(), switching to those restricted credentials for the
> duration.
>
> Mount setup calls clone_private_mount(), which checks CAP_SYS_ADMIN
> against current credentials.  With restricted credentials active, this
> check fails with -EPERM and the mount fails even though the calling
> process is fully privileged.
>
> Mount setup is a one-time privileged operation and must run under the
> caller's credentials.  with_ovl_creds() belongs only in post-mount I/O
> paths.  Remove it from ovl_fill_super().
>
> Fixes: 539a0879de47 ("ovl: allow to specify override credentials")
> Cc: stable@vger.kernel.org
> Signed-off-by: Disha Goel <disgoel@linux.ibm.com>
> ---

Hi Disha,

Thanks for the report!

>  fs/overlayfs/super.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index bd0a3f9039d2..29f9489b8242 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -1557,8 +1557,12 @@ int ovl_fill_super(struct super_block *sb, struct =
fs_context *fc)
>                         goto out_err;
>         }
>
> -       with_ovl_creds(sb)
> -               err =3D ovl_fill_super_creds(fc, sb);
> +       /*
> +        * Mount setup must run under the caller's credentials, not
> +        * creator_cred: clone_private_mount() requires CAP_SYS_ADMIN,
> +        * which override_creds may have dropped.
> +        */
> +       err =3D ovl_fill_super_creds(fc, sb);

Without ovl creds, the name of this helper is a bit odd..

>
>  out_err:
>         if (err) {
> --
> 2.45.1
>

Chritian,

I see that selftests are failing on upstream:

#  RUN           set_layers_via_fds.set_override_creds_nomknod ...
[520332.680688] overlayfs: failed to clone upperpath
# set_layers_via_fds.c:516:set_override_creds_nomknod:Expected
sys_fsconfig(fd_context, FSCONFIG_CMD_CREATE, NULL, NULL, 0) (-1) =3D=3D 0
(0)
# set_override_creds_nomknod: Test terminated by assertion
#          FAIL  set_layers_via_fds.set_override_creds_nomknod

#  RUN           set_layers_via_fds.set_layers_via_detached_mount_fds ...
# set_layers_via_fds.c:711:set_layers_via_detached_mount_fds:Expected
layers_found[i] (0) =3D=3D true (1)
# set_layers_via_fds.c:39:set_layers_via_detached_mount_fds:Expected
rmdir("/set_layers_via_fds") (-1) =3D=3D 0 (0)
# set_layers_via_detached_mount_fds: Test terminated by assertion
#          FAIL  set_layers_via_fds.set_layers_via_detached_mount_fds
not ok 7 set_layers_via_fds.set_layers_via_detached_mount_fds

oops, I thought these were running in CI...

Apparently failing since v6.16-rc1
c28f922c9dcee ("clone_private_mnt(): make sure that caller has
CAP_SYS_ADMIN in the right userns")

The question is whether doing the guts of ovl_fill_super() with checks like

int ovl_can_decode_fh(struct super_block *sb)
{
        if (!capable(CAP_DAC_READ_SEARCH))

Without the user provided override_cred is the right thing to do.

Could lead to confusing state post mount.

Thoughts?

Thanks,
Amir.
