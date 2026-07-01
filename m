Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26193BBFD1
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 22:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782946713; cv=pass; b=i1k/8caT1oSWo2SADHteCVovOKC784og0+5s3nW+4E2rj40cWPmuw4NG8fmELvbh3OM/uPAMrULpCb5MOc/KsYL9BWCr28d84PDedHlDrabtBqEf2pUHDzTp3pAMtxwAXEAZtzJOmhQVgoZR85QgWHswqWcOLgx7CJril5Zy4W8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782946713; c=relaxed/simple;
	bh=v333IQ17seFPobRriFVv9irQiGfOh08ZeyJ80kHbi8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MsQ2zR0BF+tgk2xd1eKsFwKHEqiwP4exMcBHSiLn2WZYpeCdO56VtIPRdKxZrx5QRT3hvpdPQ9tlBADb+qp+LMrMCzGhwLh/RdCwEvR7GLfzTsbjIzqNQTSYuVYVqdXT9S3m9mi2Eha8v9Uo6vc9xtzQHiAONkSzml1L0K0s1PA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFMFLejt; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFMFLejt"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8ea70ca4fc8so8921156d6.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 15:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782946711; cv=none;
        d=google.com; s=arc-20260327;
        b=jYTGh48gVbak25IZ14K4vm16s0UtHkdAo/bBzOlipu9ZfDuX4HT7Lnc/WayiJU1EL4
         3/pUlQQRMiNb9NUZvGs1bdDOW83NiO1HyMnXocchW8u+qAc+e6opIyIsz4YT36aDDIoS
         oLDHwIz45AhDGJTo7FORXYXhUMIs8/C5U2oWZ0w/Zky505PtLuPv/qMh+8qiC/olgQMT
         PDft/iUOQMVhrCe4T2dqy0i1cE+s4pPWfSjIm1gC8HQK2khFAQAPmFfjhKKIierXf1p0
         sANxE8pH+JcZ26vCT+jOC2eVS4JCIHctijhaCwsh6zjdexQwuJQ/EI4TuIe9bg5zLPfC
         g8ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CGmjOEAN5rh7B8OxF2M94IMyzquznWKtrlOs0FGhk1c=;
        fh=doNdKGep7rUYHsZpyLq+KNHUL6Rw9Z9SLhH1dztm5+w=;
        b=VsjG5ANzU5PQLGlUYhteUnkN//Sc73FN5PO8zIMm+v1yBxW6EE04fq5zmY7yUD5joy
         DAAoJgfmTq538yqn2uSbQcOfK9xnZ96we+0+Ywn35AV+d0ZrwXmuDFGHWT4++D4ZdQ8S
         lWr6mLlDXKe4M3pqZvt7SfScm3PUsysCBifX0/PmR2F/OP3F9Qic14iyvXm5tM74ZKvj
         ykoe4uoX53bZ71K6cqN1S8sUysqbhCc34GXvfmRC6uCpiHPXwrrT+b2tUXTrYRa5Jons
         zl4QcRe9niiyzvPgu1rInyQXiHclochheckV44p3hQ1KgoZoBl0j+xgrILglvUoO4x4D
         es8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782946711; x=1783551511; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGmjOEAN5rh7B8OxF2M94IMyzquznWKtrlOs0FGhk1c=;
        b=FFMFLejt7D9ehe+p004hrq2XpYh/HnFijFKVfrm8olTlbQQ7Q7yb6sS8daedUAOGKB
         6ppRzKfwcFgKnNWKKZCE6lRbSrfVChgXrJ2eDvBGCtvSvvffEJgsf/boiPb+ZDxXdvM3
         jEmUVryajCTjqPWMW4oqmFlumVnrN9HEaI5FyMjkJl2TwZxGCHXsx/IhjQjvDSRsdW8y
         ci4HYwBhSnUhNKlgPp2+jbNcb7bE9UE9b8PV15OB0S0VWPHeifUM23eKuQT5ZR2Jwm4+
         guR9YrxXCt6E+5bP4RccjNaIhWPN5J4t5uV62EOTkayWIG7vRIM5AgvE/c5wYCTy8lnT
         rJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782946711; x=1783551511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CGmjOEAN5rh7B8OxF2M94IMyzquznWKtrlOs0FGhk1c=;
        b=DwDddt55x02iNfimGG6e6hmyc9Qh8gOmTj4reK2mkIKcVh7ZyGvMLZsInT1YdMqMf4
         +1bdB/gaq6A8fllv2y0es42h8wM4xAqAL5ZdvQCr2ckPmx7eKcYmDEKjVLPUsqZOEm1Q
         n7T9cijOx19me/MdT22otodv20MR4jO81JKwXdpM6Cs8YS8/BKJV0FZmnj+I9sh6RcHe
         g2wXGOs+OoORuePFdGYw0eSCzrI8CQlBkeErOiSvfXwEjbxroGNjOVYxiUmVOcR7Oa8g
         +TRAIiJnUwMf/hvBm5RsxRs98VG4kaq8x9GO/IIZIPQ2yms4HgrEkb7cQPklshf2X2Gk
         s9aQ==
X-Forwarded-Encrypted: i=1; AHgh+RoC80rJKFuusZGhpnNU13PSvmcvtLcJCTlqBOkGNk3h4flvQwnPubleUR+Sk5gJjn/YRK2uK6/3jSJPsfldj5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE8lE/CYzTGmF2p+FNlQeTv72ic+oO3rRkdlgOaW04QCjtmRZ/
	3eY+r/6d0DbIQyF5BWxc0HOQF+mFE+nXL3WEnBW27sgdEgY270CwUI/jwS2focf+guq27H1FSYe
	x1WkETHzPzpY9cD8k6ylQw3Dit8BkUls=
X-Gm-Gg: AfdE7cm2uHmgByhmrPC837H29sXMhFrG8V++9Ii7oPuej5gjZ72zYtOlnNMp0Fq7vYw
	XIfiR6iZfGsAn7h57QHGLF4jP3o5R+16Jaka/YuL20jDPTSbmbimQBKT82+pdsYm84xK0MbRw0+
	v8wUJLtG2s84PNL64eMoO6yoqGS2ePGzsQf9dG7OtU2S1nUa69GxhmLcHAHsEz+9t0NUfVj0kuM
	4cvvtgNkfn8/rPxi1rSYbeghUS0fIsl1Df6vMwgpEZU/m+6qnmKROsLc381PplXLRbH2hTbGh5U
	q7Ks7eWAGwNENm8IKR+b1nSFNUE=
X-Received: by 2002:a05:6214:55c1:b0:8e0:c0f3:a2cb with SMTP id
 6a1803df08f44-8f24ead200amr108961456d6.0.1782946711091; Wed, 01 Jul 2026
 15:58:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630183956.281293-1-dwindsor@gmail.com> <20260630183956.281293-3-dwindsor@gmail.com>
 <CAHC9VhSYNF=_Tfe-D99rHy70EXQVr1ES0arxT09Bidey4zOFdg@mail.gmail.com>
 <DJN0EPROS056.3RY0R6W1XZHNZ@gmail.com> <CAHC9VhT37f5TwgksE_i0Yttpy3i7niBr6QrNVVmpwe_eGX428g@mail.gmail.com>
In-Reply-To: <CAHC9VhT37f5TwgksE_i0Yttpy3i7niBr6QrNVVmpwe_eGX428g@mail.gmail.com>
From: David Windsor <dwindsor@gmail.com>
Date: Wed, 1 Jul 2026 18:58:19 -0400
X-Gm-Features: AVVi8Cd--WxIEfBHVAG_4saw_HtYaBPqRNY7ATulZIzQtiR23TCVwYiJaDu_5Wg
Message-ID: <CAEXv5_ig4P=wMoiy4h-TbZt-Wz-YBAs5k6R4szSSxr4C0kjCTw@mail.gmail.com>
Subject: Re: [PATCH v4 bpf-next 2/3] bpf: add bpf_init_inode_xattr kfunc for
 atomic inode labeling
To: Paul Moore <paul@paul-moore.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Matt Bobrowski <mattbobrowski@google.com>, James Morris <jmorris@namei.org>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Casey Schaufler <casey@schaufler-ca.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-integrity@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 8:55=E2=80=AFAM Paul Moore <paul@paul-moore.com> wro=
te:
[...]
>
>   kfunc bpf_init_inode_xattr(...)
>   {
>     /* sanity check params */
>     if (!xattrs ...)
>       return -EINVAL;
>
>    /* get value/len from bpf dynptr */
>
>    /* hook will check for LSM specific xattr count/limits, allocate,
> copy value*/
>    rc =3D security_lsmxattr_add(xattrs, LSM_ID_BPF, value, value_len);
>    if (rc)
>      return rc;
>   }
>
> David, if you like I can provide you a patch that implements the
> security_lsmxattr_add() hook above if you aren't comfortable writing
> that, but if you want to give it a shot that's all the better :)
>

Makes sense, I can do it while I'm fixing the remaining issue flagged
by sashiko.

I'll route the LSM preparation patch containing struct lsm_xattrs and
security_lsmxattr_add() through security and the kfunc and selftest
through bpf. Does that work for you?

Thanks,
David
