Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417CE36C9E4
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 18:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782845212; cv=pass; b=LBBW5/IpD72SruKxlEvFhUzQQNpaFqPGnU9+Hig+y9Kbm3R/b6UlBWMTQzBj4K8n3BFdvpPVGoRUGq9JAAsLWhf61TCLuHqhEcHjMUOmQirzewXQhgMZq+dB+MYLwiOh8ZKTseiYxdwsVpvomScfXODhaCTakfldNN3FLjeLH6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782845212; c=relaxed/simple;
	bh=/mr0mxcymU+YTx8PbSVH8xKSeGb4CtbjDq3BsjMlcFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oagPiu/M8JJzhHGRma+PV2v45T1fNxXfnq6PXyf8AACB0pzum4dwzFPP5oZDsNDk49Nnx/kAjUNjukI3CWDyw2kOk4OkfP9yPQaCitOrusikFsfaB9zKEZ4P0ixR7V0L8D/ZiHIjpYimoyQFo198NMemIu0uYzcJyiweryqTvzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQSgW7XY; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQSgW7XY"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8ee88fce536so23697296d6.1
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 11:46:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782845210; cv=none;
        d=google.com; s=arc-20260327;
        b=QqWDx2RaGS7BUk3Fe5yPcXHKT9Gk+D2Or010YOxwDsg9jKRYAaBQndzOTF1tJRISgo
         K/xPjyIe1+VULaAtEz1zwDDjPFQu8NJkWrPhWCRNROsAyoMxkoDTj+GN++nn2Epiak2x
         hsDn5vJVBhKUOE1LeEqlAO2K2iehpHMjFhKkqESL5/7rkPrHgnPghTprUCfRFlPOBHOU
         JOg96drohX93utlYulZCJrToIda4knSB1PuRYX6K9qVQIPiWojjPujIWr58OcEO0MTEP
         5wr8oS7UHyKy5C81jNY678jc/5vN9WuuJY+N05hKOzQt89hX+kCXvy+8Lo9pqjv/S5An
         vdxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/mr0mxcymU+YTx8PbSVH8xKSeGb4CtbjDq3BsjMlcFI=;
        fh=X/M4CaLxzlwPd8tyKYEYRJT+I1OOw+S/op50rs6EFLs=;
        b=eaXOUh3k0q41HnaRptSRVd2FPJEcExH0Y9o6CydAg3BRVQq5r9pEuss/2sR98ccyFe
         z+lZP7vxuYd5/BEv5pfpo6hbsvM9V6eh8qv1bGf9GFbUjg/NPcyVAfDaziiZgzRCVDgs
         qEXWaDiLNqXBHBN140QRHHsX/1nU/VlJy2nys3luzd24GcDydHNonkQ203u+To++b8IJ
         qAg+NbxiASC/56oECTUq79ddFZprHU5M5jALPZ65jgjz5YQhYqmHKx4RJ4ub6LT7c7kP
         pJkIgn9ogvordORYjXY48QMl6DN0a7Z/yOQBHuDGXNML/c3zCBFoFkED+fjc1pA7Crsa
         vZHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782845210; x=1783450010; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mr0mxcymU+YTx8PbSVH8xKSeGb4CtbjDq3BsjMlcFI=;
        b=EQSgW7XYwFqpR2UhR5oIjGjz1p7Sl5z7prkaHtU62QYm16o5fwYNMZbZzXDw4N1o7w
         TjaTc8/oiqjtm0zKD8i/CcS95pH2dm+43MADe2rn9aMf1hKPGLdSdl+rh7nEvSKdwdWb
         QjR+GW8xwXjKE83wXgRxXBKZFIbpxBvEorTFKDTnaw6FQqAGR1E6nY0qU6hw6SonOJ6f
         UnNgIa6B4mckZ2hxw1SIudwaouFYge5A1ubJndzfYxye9NPihpkUAmXXjBYL0RLjqY1x
         hVUSvSmtURF36OOyxm9jT4L44uwrOo02x0k956HPazkIOlQs3pQRuCDykMIY8f+Jh/HA
         PW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782845210; x=1783450010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/mr0mxcymU+YTx8PbSVH8xKSeGb4CtbjDq3BsjMlcFI=;
        b=UDrzN0U1OCQaI7GykP/SJx5+TcR14W3j22VztlMSeZ3FwMOeomNG5Gbslkp8WCaWbG
         dvDYnhgBOVzQahNX8nucASnNaLt4OvMGeSJXzc2AYY+fbKVPuhfNsjZK/CjVnhyR/2yc
         CNuPbLmNnmaybicNvrjf/8Aw66cpdB0BTh6llEq2qRvuzPhfUkDPfG2RrxZKrIen54wQ
         m2nualuaBawvMjyvbrt3poeA8CRLcWQ1olUo3OQV1Y30768ureeLbK3qJ4tCYp0LjySb
         npguIa6ca/q78ObHJ4nqXKP0e6b0isZ7USS1uyc81pu78grgl5vnfazo1gyXJfKTsITI
         Yf1A==
X-Forwarded-Encrypted: i=1; AHgh+RqFlFQaq7Cf0oUqfGsB0uh2H7OOVNwADz9p0p2+TPT3aVmTMa4E630x07yZoaFWPwHP+NcJas4U/mDxWfbZLqw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ZWqnuxJ9lLxS8YNMU6qaqtNKy5udFB6JejJ/FCobmoVya3aL
	caryGvM60x46Pr8vmgFn9pyCNGnxnRhC56+UewI1znH+Ht3hIhtS+j2zqGFQP1RRG0+8uFYawvd
	2iNLTbNJKFgGaKY4yJmxeYXCrSNkWfjY=
X-Gm-Gg: AfdE7cnrmiO0uBAgn/ATRMIvrIUPJuMCvkE+RENJI4J5jiHk7rzBuGfwMnowHxzqeqx
	SE/h1BKi8S5DXZ48IPvAZnf6R6+RPeZu1mGWws+TO3h34WGteyGxlAWk9rTHpQ1zW8NtPAs4kpZ
	tLB0FBi1+WmWeNN92hfE9dIzwQmmkLhPS8wRCU13TF3iGi8JTDbyrzyOJDqRkTh6Kpcds2Sz5NO
	KX4oUgRjlaRCNvLqApgtSob6/cjFVINKvGBQBWQGZFqZToJr8R/N5VdM/xldTAEQzKv7lgt7XEG
	7jhdRtvU+IGSZgMSR5iE27RL181XKhCbnnM/PA==
X-Received: by 2002:a05:6214:4d01:b0:8f0:b08d:1327 with SMTP id
 6a1803df08f44-8f1bab7325amr66906576d6.20.1782845210237; Tue, 30 Jun 2026
 11:46:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630183956.281293-1-dwindsor@gmail.com> <20260630183956.281293-3-dwindsor@gmail.com>
In-Reply-To: <20260630183956.281293-3-dwindsor@gmail.com>
From: David Windsor <dwindsor@gmail.com>
Date: Tue, 30 Jun 2026 14:46:38 -0400
X-Gm-Features: AVVi8CeaiheJ3F5i-jO4LvtVLGlRB5U5ReoDcpDUEtFteA-6-xXjOCWxSS0LCkE
Message-ID: <CAEXv5_jCoYbs63RRukH44CMCxiOFzvWWraBOunKrgTVw+inUPg@mail.gmail.com>
Subject: Re: [PATCH v4 bpf-next 2/3] bpf: add bpf_init_inode_xattr kfunc for
 atomic inode labeling
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Matt Bobrowski <mattbobrowski@google.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, 
	Casey Schaufler <casey@schaufler-ca.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 7:23=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
<snip>
>
> We expose a bunch of VFS heavy operations for various security modules
> and this is really not different. For xattrs we have it all centralized
> in the VFS and in general all VFS related bpf kfuncs should continue
> living there and be registered there. Anything that's just bpf infra
> specific can go to security/bpf/kfuncs.c instead. But anyway, it's a bpf
> specific helper so it's the bpf maintainer's call.

After Alexei's requested changes removing the attach-time checks,
there's really not much left to go in an LSM-specific kfuncs file. The
bpf infra plumbing for registering the kfunc and bpf_xattrs_used()
seem to be the only LSM-specific bits aside from the kfunc.

I am willing to put this code anywhere. I've tried to CC all involved
in all 3 patches, even though there's some split in concerns.
