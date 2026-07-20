Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C3B442FD4
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 18:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784571142; cv=pass; b=ue6hvtZSZ4sEa7AmhkU2cu1gfzxwh2e0GrjPniTlGstMxwTfBAn3M8e6FtelV1Ah4m628CKorvMZF9yGIQgdL40Q5kO71OEnsd1mw8+5DpR94+Vrbf5c8HVxMVNw40uf5lz5fOq8pRtE6dMxIL4TE7utCDRWLAk8EbNDNp099jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784571142; c=relaxed/simple;
	bh=1JX430VNbqj0hZ6Lzk0OOAcmh3W6k774gqZhhQCrP/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vd0ZVUAoP2KtKx8mAAmC5omdZHGcOt5wwaywHONueYF1FHOgXMO0aGrYBsZGhrIBh1vZlCKKM6dDLoB3PbyNh4uZowyRl4MTh/NsbEIGd7iC5iVe2KlzDFzzcWJAxAmk0zo1DOev0/THCUP2PImvQ/1YN7AF4Uh12Li5NDfWfyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWLp4eZh; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWLp4eZh"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ce98cb8165so43252065ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 11:12:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784571141; cv=none;
        d=google.com; s=arc-20260327;
        b=XElhv7RNi4ZnMtMoIfM4Rb5J3xCYroLjLilaeQ4ZUI8E5HVrS2Yfb+Z2uY0zoHdpHu
         0YCN3yMOoox64BMqVioJY5X03+5nNTZVru5m2jiycBBuO5hsMaFcStDeUcY0xS6tKh+u
         r5yaYI6mGAoFH/wswEBvkyHWRaWuU72d5qjAzXiZlk9clGeLmb2xR92esQaz+lXKOFp2
         GJ0kb+3r29Sn7luCasppEAZnktgTgRIY2/O54vUz9nBgNcsU0KliYibKFkrqz4QLnBWV
         chT3GcmcMzUGBJySyXiMTjVkEdlzbVt1BBJ7YP9vxumb4wa+1C4Utob17ugjBs26Kywe
         cGNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lNJFFcN3wjr5bUpQXM7xbGj3SPGWcRQviakfsaDwtEQ=;
        fh=Iym7OV5bL1ns1//7doWcQPI0mfHoZVPhq7T9D0cD/lw=;
        b=Yqxcd/TRaZtL7zG+1xtaQKLLfifag3rCm11fWkkq+8YCy4kXi6rDQ87r4dwI2Vf0uz
         x4LX1KlUOyQINtLyUXuN7a7XEaZl8pYjmKmsc/D+Zy6BXlTFJ0DpZhDwJXxqkAoqdMfT
         KX8EQobCRDO8Hh82AALEJOeE7dhCfbkyh94KCUV16rubNStLNhOfrRSPSOgKFPJa3duP
         ViTtx6PbiLr7inXeoeYJavEbqKO/+soUZ5H3a/ZN8m0rmIsQPALDZujM3qOdE4wZbDlZ
         aifkX9KpkiCfgVY6/JoVEH6Ki12Vc26wITPmbTV8Z5evp4h9hOjRXBxvSTwUJiTOUAIl
         4wFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784571141; x=1785175941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lNJFFcN3wjr5bUpQXM7xbGj3SPGWcRQviakfsaDwtEQ=;
        b=KWLp4eZhCGEaAiHAaTC37TOMSNgeCcmI9tjMngAHzbisyIIl4DD9oLzg+2o95wMPsv
         hE6y6Jl2R+fRW6GE7j8EoS1lgNSWUYXfvXHSml+nSoWRFyXNmaPRqI3r+WomGDlOOfse
         KEN5FUQx/u367rVVi8P++/X65Pg7d86mfGno+CcG8y5Z4Ww7bl3cicaMvNnU94ZyGf31
         tgRqMiLTY80YuoEfpKD/fgdKKmmq0VGW5CPlyeiyORPA5gn6NnDOHFi3fY0LAKS55pS7
         zlCeCbqa0b/kzaq5RD9bgq2lWh1NGTSIzn4cGQvlFvEodoT9KXZhOkSsuPwxBpSCMOZq
         b47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784571141; x=1785175941;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lNJFFcN3wjr5bUpQXM7xbGj3SPGWcRQviakfsaDwtEQ=;
        b=oyOudP3paNTaCJYwK4UAo2lncMsITuG0ctMchiUPuCjOFjhCsmidpkRW122/zFQak4
         wa9aVZIzkZZ7uy3oP2JWJ16WNv8xnmfhkT8PThJflVuWrJzInHz6KaOxHTCvzKHwDnEE
         xkunZM4pZhY01dNa0rp9MSbvR6QXkc5Xsz5029PNqhSMs++Yr/bwX8q81z+w3YuBfCOt
         CuzSMqByyuYSE+kEftalh7voEI3oD+m9yT1kRIU92+TkDi6EIWeUbrG9KthbzioH3K3E
         BgFk3pASxe6eUpaHX65Ay5JjSaMzsbYDDuuTKtuVoyl61WzTy3aULcI6PK8jLVBR8Kyv
         ke/A==
X-Forwarded-Encrypted: i=1; AHgh+RpHpHguHAIpy658TSkXFaUEcgPEak8YylV8ZOJL7yrt7OGzSmDqhgr5C9M90AQHJJ6x9neJBFq6dQeNQNJxuKY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd0wop+O1yabt8UK/wc6QZbBSCRCBiepVVrE+M7NVutZOhVCuU
	bhUCfkL3xbASaIPGNxWnQUgjZP5QkBUvrOOEU8RpTJWh/p8lWWgCiUS9eZj2R763hSk/yIUvh4A
	cSUpWgZAKdXyAag866km7z89vchY05ks=
X-Gm-Gg: AR+sD12gU5v9lY/icKwLVfH0zyATJxu+67wBJL1TriTseVMGAJ2Buh5wERR7UYsO6Rx
	j+TvCbYw6M7oWUBWSlZ2egnPQuSqgk6zvhAuHpQfByuj0koyDv4S9tvMVn1EieEiT5edejqA5ju
	jxeQRMMMe8Tb0TUPXpo9Q2d2aX7EwspJoIwaL5SoJB/yC7Xf9PVH4ZZsCrf+ekbciK58v26tHUw
	CxuQAxD8wFDZ1avqbqGaQH2WCQh+rnb234VmSGxAS2M8SdUJ35Iaf1WnzTpYdkfs0BMVsswMCiA
	C+mIWY4NSPfSpq93
X-Received: by 2002:a17:902:ea10:b0:2cc:ac15:ff4c with SMTP id
 d9443c01a7336-2cf1f29ea6amr213030675ad.8.1784571140752; Mon, 20 Jul 2026
 11:12:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708000956.46138-3-dwindsor@gmail.com> <a3a376bce713ac38ce6746508239c1af@paul-moore.com>
In-Reply-To: <a3a376bce713ac38ce6746508239c1af@paul-moore.com>
From: David Windsor <dwindsor@gmail.com>
Date: Mon, 20 Jul 2026 14:12:06 -0400
X-Gm-Features: AUfX_mxSx6cvDqWkeZpCRVrryYfuXxFSwFH_5FN2Ivh39vzoR79SkwFUGoqzhZo
Message-ID: <CAEXv5_gt7BPWvdR4D1_3XJ0_XpBXWN52jeAOf1K2QJ7LL6CtPQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] bpf: add bpf_init_inode_xattr kfunc for atomic
 inode labeling
To: Paul Moore <paul@paul-moore.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
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

On Thu, Jul 16, 2026 at 5:55=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
>
> I'm sorry David, now that I'm seeing this function again, especially
> with the LSM specific bits extracted into a LSM function, this absolutely
> belongs somewhere under security/.  It's only callable from within a
> BPF LSM callback and all it does outside of some BPF pointer boilerplate
> is call right back into a LSM helper function.
>
> If the BPF maintainers aren't willing to accept that, then we will all
> need to find another way.
>

Where this code lands doesn't matter to me, so I'll stay out of the
decision of where it lives.

If this kfunc goes to security/, would we also want to move eg
bpf_set_dentry_xattr similarly?

I'll roll v6 of this series meanwhile and we'll see what the BPF
maintainers say.
