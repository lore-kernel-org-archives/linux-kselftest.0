Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4176A3515FD
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 03:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727319; cv=pass; b=LOhcEx47AzP5OfeJuob0mj5LV9J8NXBydUDjZt0YCDf0vvdpcx9m4Zk6D3/TuA3/EzZSYcNjhBiDJMdHxVxjL6CM89oPE7EKgk0t35aj98iOiMi6fjpeE6ujPM185C48dUVNDv05nYpus1OhGma9lz9KKBMsNooxq8LA/3V/Kdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727319; c=relaxed/simple;
	bh=XmrD7po+qWlEjJrFKCWclrfr4C0b1O/uuTaCBqXcQM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OloZ94jwsxxkTSKlWn8Ctyx475k+K961lqUzl3fuR49OLfiHQV6WFrA2PPjFcF+3HTVoJsQpn2L9j/U4IbOcmUKRsl/KhwW1yAZ2bMhXWyz2loq5IlmuveL9k5xUMJB0fvv+YfZAdescgunwIEZ7xOz9xTpo8mvF5ngg7+8+IbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YpUp4Ela; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YpUp4Ela"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b0f19bea2fso3264669e87.1
        for <linux-kselftest@vger.kernel.org>; Sun, 02 Aug 2026 20:21:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785727316; cv=none;
        d=google.com; s=arc-20260327;
        b=dZyp7iWTN1imJqcB5rNZHSTcHnJDOJmHRilBPHXe7ZDAN6wOMrfY84p3w8iwc2IrlC
         BdDlh5Hu80enyhMxCmb+FZCS7wPXBtquIFq59nMqojXPr3OpIySaB56Gh4O4ANUsntGz
         EUPj2e6LhyQB3dBa7Xq3k+HajWoOxlTFYS1ANFnYE7etRmSFVy+omfe+cwq+aa8c/IAv
         9OiIF13D+cJLtiq0T3ky5HbtfLW/B1tGoygYiiNkfqJXM+bZ0yL/IboZknlsC+d3WMOK
         xmnjtdlnI3/LA/otblYrgayWvNurGBw33oK/7i7vH2Fviwqss+h4/27V5x2b+k20XKqn
         KUfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4eaJkWqBYFky8ybWnIgHxBVXwUECVZTbdZzi97smpQw=;
        fh=Y+lA0FPsWDc0ksRNAp7qdv72xqQJfpLQQA8kiKEUajY=;
        b=hxiYMAMme6ZOLTGJdn31vaL1jh69hwQYEiajYeTqfvMr/pSKext/uREHO+9HES/ZUO
         tbjmyasN9W4n3HIINP95GGWBro5ONs606aUwIXcUEZ8KdHVwOMDw8/727F5egxCek5jM
         s9m7nKxG6vKC+J47pM4icbgSc/AWdm11eXSKh5kjctYN/Xxd4IQ+lvGJ+QPn0BUopDKg
         BDOQXVZizDN37oQx/pXk+hj2RjFe8iV3iYidCXU/5MnV9ootu1K5JAso5Sy034ZIVSkR
         kPAEia47/1gGRPxMfId3obqiWM87M6roQ2w4MaN6dkTgfX/KueFThlyhzp12JSfkJuRW
         L+kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785727316; x=1786332116; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4eaJkWqBYFky8ybWnIgHxBVXwUECVZTbdZzi97smpQw=;
        b=YpUp4ElaMF0/z+0RVxCxc2Dh2oQ4+mjEg6DlXaoE/ybjhRpv/tCDBTaG80d0X/lE6Y
         8FnK/6cHDjz+CscQCpJX0dOreZeev6NbTG4S+xVkkUyZWng5JCGRMDo/HIjaCyNq2Fxb
         qIh+qmy6qw1nGORNTmYQSgyWoDMTK+VTZBrynlpY6SyMcojwhWKNk+DKxhiWR0SbncQU
         tbs1IRilw1bdrylnD7Lp11EKGD4l/zj+Xt5ul1o2J7zWgKbJe352ZL39ktMLEg7ke0SL
         Jg60hHZ9P0yO6vF7x3vu4+sAcWWgy53NMtUHaLsB77yAIx+qqEOm4gKeQr6u+FWA9yLp
         zNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785727316; x=1786332116;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4eaJkWqBYFky8ybWnIgHxBVXwUECVZTbdZzi97smpQw=;
        b=JC6ZsJoRrD+7hv06bJ/qTi6DYUQcQTtn5rVfmPUYo2uL3nV4ZqTIXppPEoz1dwTa3M
         7wpR6VMev1M+hpaRo+auw+rQRLbK1y8BCJFlcyy5nbWxNmuGwIVdmxGHaC853jXvQC98
         +lnwSBhsq2t7cZcxH8ZoeQgWgJtOMR6iYtOmBvYDE2viLcP8lb5xBa37HAe2CJXoPKTv
         gEu2Bxr1aCS1fehOSEbaLVaMfCBO2e87yPxOGOrJ/l/YrMF2Yn0Qt8Y4XJv2elnQ8b8M
         k62mY1tgARfI4JBHZtw7lKx2WoXRQonT6vgzp4vuqUk+sjK362X6A34AZUfxKtkG2ZwM
         0Xdg==
X-Forwarded-Encrypted: i=1; AHgh+RosbCg0dKf8ZNsgUBsoY1E/tWM1/QLCocuiqpq5gtQUITR/fre7Jo2jCCUIZ2b2MJciK9kjylzDKhUXT0HNK9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YynWMpseV1BUeobpzh6Wf7e9I0aya14HiCBdpqx4w+a0ygIWqeN
	tkMo+7Ms0/LKwqzdFJrOkSje54/D2UpyeQOW8iqlgcCC7XCM76kVFPBmSuKsjLR9VFldu/c8RDU
	HQlejtrYWu/ITaino7ediz/2xOpvqXnFpm/oVcU8=
X-Gm-Gg: AR+sD13yCLJYdRNEJljsWEA7/KzsJ0fUnJndk6TfsUAv6jCDGKDBmeLJ2EhVHvnj0lC
	WtRXieqjahozb1Vn02TaGoNY++fqRt0amStNWB1uTh+TNoT9h57nlDByjAKsYzKTc5K6bdCgPUT
	ljMnpW5AGdEpDEMQpXSA0rxml7l/rx84ZolOKkfeFY2NW8FkbJUb/stpYL6xe6MJj3o9UbRA9eC
	yMmbwfwGEAyIlDGG7DCP3hJtkhickPcCezcfw4pq9mJIw14HvQDD7FNJn+4WLuAQHxDMT39WCTy
	1fwL+Y9JD+Tt8K6GVwGmoUn3+QeceP7dKEgFtNFqOcplvxI=
X-Received: by 2002:a05:6512:3771:b0:5b0:1a3a:6680 with SMTP id
 2adb3069b0e04-5b2e4f6fa8fmr1032391e87.30.1785727315981; Sun, 02 Aug 2026
 20:21:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726021304.97ED91F000E9@smtp.kernel.org> <20260728033837.1466123-1-dingning04@gmail.com>
 <DKEUME1DRKOR.2R2XVNQDZKVSR@gmail.com> <CAJP4iuumoLdD62rXf=3HexiKVoKbXHJka7tm9+Cw-LaKmuvC+A@mail.gmail.com>
 <DKEYIUKP4IPQ.M7KVG0KIIU1E@gmail.com>
In-Reply-To: <DKEYIUKP4IPQ.M7KVG0KIIU1E@gmail.com>
From: Ning Ding <dingning04@gmail.com>
Date: Sun, 2 Aug 2026 20:21:44 -0700
X-Gm-Features: AUfX_mzZawoHHKghOtMZtV85ckhlcsLiiuKPTiIuAxYTUKnhIgGLy4E1y70NF-M
Message-ID: <CAJP4iusjn58Uo7uE8NzicZQmKoips9fu8+bV0jEJFUNmXz8K_g@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: Reject writes through untrusted allocated pointers
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, andrii@kernel.org, eddyz87@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, shuah@kernel.org, 
	danieltimlee@gmail.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Second, I don't understand your explanation. WDYM by "after the access
> permission check"? It gets invoked for BPF_WRITE, so should be rejecting
> res->key = 42 if 'res' is a pointer with PTR_UNTRUSTED flag set. What am I
> missing?

The direct write will pass this earlier permission check since
type_is_ptr_alloc_obj does not check PTR_UNTRUSTED:
if (atype != BPF_READ && !type_is_ptr_alloc_obj(reg->type))
         return -EACCES;

The later PTR_UNTRUSTED branch is not a rejection check. It means when
accessing a pointer field through an untrusted parent pointer,
propagate PTR_UNTRUSTED to the child pointer.

if (ret != PTR_TO_BTF_ID) {
/* just mark; */

} else if (type_flag(reg->type) & PTR_UNTRUSTED) {
/* If this is an untrusted pointer, all pointers formed by walking it
* also inherit the untrusted flag.
*/
flag = PTR_UNTRUSTED;

}

For res->key = 42, key is a scalar, so ret != PTR_TO_BTF_ID. Therefore
the second branch is skipped and has no effect.
