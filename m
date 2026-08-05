Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637803B71C6
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 02:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785895711; cv=pass; b=Ju3QPz2ZlNIAbJoTL76ezbZCN1GXjER7N3dQPIEUkl59lsYuhJ82z0YWa1BwXD4EJN4Tqt8boGOVB8BoDK1Bi/zSIEaHZaHoAZgbr6zhApIFWw6n1XYYTi86EzzJGz4sQXp9mQMs4IllhBnUEnO7l1D+JNel9iWoqgF7KuxGNv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785895711; c=relaxed/simple;
	bh=UBrIoFn2KHvQ2srfH9Cda31RItNTXxlXadl9iHhPyaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AOKEntRC70Kv6ows5n4v1gzJZ7dl7MWf7nsZBB55I+sSJ2TkHQv66Zht+MO8/l5f/7qyihrPyChSjmpqV4STCQ/GSFGNASOwWOSybE+EjNESzeLISTcnejz2rTr8dyfL//Im4asLEtP48OWl1uPoDVXNYJnSDqi2W/gpd9naZrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VR4fcZJx; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VR4fcZJx"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-451d8064238so253541fac.3
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 19:08:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785895705; cv=none;
        d=google.com; s=arc-20260327;
        b=VLi23P+vEHFCcJSw0+OnAb9U9y0gZmLqIytGeFuAZTyDuwInSk4iXSIRBilFfl/tks
         gqCl40c7bbiStxrOEamzDfm6h3QfUrAJ2/nnVZpF/JJVJjum7f/F3DgGnK0ewevrjHBn
         IQuIgLtdp/G9QdDSdtQFpdJl67D+3VGhIGOJgpeen9NegrSCV7cSA9M5dT5o6na/q9ta
         DjGzD1VM/RaGsu5KJBcoABWk26QLIH8LHP6QgocHrfI0BHWVR5Bsapm1EnL0R2SEWzbz
         4FilvSVwiplGgmf046IQEB6DnYRC/9YLu7umaovysElTUMb7KuZ2yNklkftilBdYtemu
         G6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qn5iscN2QzF14sWFnednaGYMEJaac78X8NTKeF5v3NY=;
        fh=s1Rkf6NbH461LFFPKXCi8Duqlc/NsVnZ7W2XUlntWcw=;
        b=kXpb37kLJbRfU84ZQ4qTpSAQSSWub/CSCnxQXpXcaE57WdCrMEe27H+yA4RTUHXq/7
         JlW/Ctk9SV0V78ZTs5cJ7NpkKkGUSSH64fRoY+1O5EHfP5n6utfW3AQHkOlVD2zsSVnd
         fkZGTP+J41yJ5fLEqiXnJI2U+PbsSmFph5iHgoGZGICCo2Bgq31CfFFMlVQ2sOauxnf+
         Nj0nmqdPYaRqc8rWa66pCS8qaUfE5SnFUeMXskjnJlEhqb+KnGA+EKjrkijisRF7Lzno
         zB/YbRUVcQe5/PNdf9w4ntpSTYtCKNJUJUmCtcb+4YAXXqDSjaxe2evGWH3s/g1XJ9YX
         RdLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785895705; x=1786500505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qn5iscN2QzF14sWFnednaGYMEJaac78X8NTKeF5v3NY=;
        b=VR4fcZJxvOdnIvIq+tYeA2bDDQomjPc76bmTk/mL3euAUbx3KMdwAyUDFZiGXibByn
         Pgyxxdfy0YjN8ORq4j88eUS/6KQxNn0hDqagdnpZUrTgqpHV3UtRrPr77zBSZSA+TY5c
         B/dmb9gh21/Lkco0KGN3ZmiXG42WX7Veco1UWRka5/Z7mHSFQlzC328RJKF5URyqw1yK
         jh/jYjyheUBsY7rYzcCETUA15XwrAL2hTBxzRxMRTZL8ZAFn2QG73O6dTWL5cVr/gVbJ
         Z8HgFHmlGH7mpig4iK2lNp/oVLqdExiU7DQrDIHS8skwWJfcDnlwCXISE8MmD+WoAzgU
         pVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785895705; x=1786500505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qn5iscN2QzF14sWFnednaGYMEJaac78X8NTKeF5v3NY=;
        b=DX8r6ZwqJdpiN6Q+OuwaigNzxVAO7b8zwKtbsYvBTUimtBSYi+RhrOmwqGvbmtnNcc
         Rc6NsQcQzhDLysUnXrnOD0kg+G/vPuEeihIzgnUfaeHU8gPHIc9/SYf8kooi0MNW1DWf
         DYkrtJml2TbEWpPRHOqG+frwKJ3kkXiaKTdTg+6tfMUo5GwtdOKbRRH4X3gq7TvFk4DP
         e/U6Fzj3KIJ491A83GfSn5Go4DB9GuflNaBjiWVjcYaEO26nMjkzfVaIt+JONHsNu20t
         FLTie38lpkkPfZ4TWJkWlpGDcJiJQbAvNDTUAYgcG6ZoKjD8lYtrfAz78HTAy5qPqyGX
         CU9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr+YFIXks6AK3pRBCzM7SgDFurvsHSnU7Yvl7FfdqYR5K6mqkZftjiwWgE3AeF5kHS6wyX9NbNhjeNCkRheQHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwtD1Ib6+YlDnKOTR6ODpTGMekhwrYr458Z+tAC21QOM5OQfd0
	lwxkwQC+DcCWpHUHJfyr1TYDosR2JONt5jdOkA1sfZ7amhrkXJUW7SH8YAiZAAApc+2yy72BVI8
	XMzxgXY7Gx9eSCDMBzHNjZgKtJlwpkWs=
X-Gm-Gg: AR+sD11DlPo47uQJ//Sio5AKIcXpF8OCt3E/AqlhMBO8puLCvDeIOK1A6dXNh5pO6MN
	1WChMuPtI/dLHstA479435ne0Pppcqk+1Itcn3S/WFmIregRjNm/us8bm0ClAzf9MLnjAMcYwHq
	gPwLpcjLFgAMZkfgILydQkuAQvvvuHSMBXugJ7kIxTCK3y2YnHj4gDqqsoX5xctPJjXoevWdUE5
	YFaXIMffRy35hi79Yf/6OYPZSvbKxLe5wZOH2eeaBWFGkXrr37Dn/dB2JFi+/QR5RP8JZhUXPOg
	OA9fubRfV2E4RqoU7G0hPWSWJCPA8U3WfjRbYvJQ4iGrnA==
X-Received: by 2002:a05:6871:203:b0:441:419:1fea with SMTP id
 586e51a60fabf-4599eda5245mr1938698fac.11.1785895705149; Tue, 04 Aug 2026
 19:08:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729022837.355549-1-chenguang.zhao@linux.dev> <20260729022837.355549-3-chenguang.zhao@linux.dev>
In-Reply-To: <20260729022837.355549-3-chenguang.zhao@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 5 Aug 2026 10:08:13 +0800
X-Gm-Features: AUfX_mzHgPzDCakbKSrKYJB9sJhoZ-nbaukmlgfyfjPz1JQxAsT9iKnGf1YwrHs
Message-ID: <CAEyhmHQOGZGJbdx21mBtZ7aNM8ZDnYTgCtLWHQ4pXy3jVcG3Ng@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] LoongArch: bpf: Advertise JIT support for kptr
 xchg inline
To: Chenguang Zhao <chenguang.zhao@linux.dev>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, yangtiezhu@loongson.cn, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, shuah@kernel.org, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Chenguang Zhao <zhaochenguang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 10:30=E2=80=AFAM Chenguang Zhao
<chenguang.zhao@linux.dev> wrote:
>
> From: Chenguang Zhao <zhaochenguang@kylinos.cn>
>
> The BPF verifier can lower bpf_kptr_xchg() to BPF_XCHG when the JIT
> advertises ptr xchg support. With ordered amswap_db.* emission from the
> previous patch, declare that LoongArch bpf JIT supports this inlining.
>

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

> Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
> ---
>  arch/loongarch/net/bpf_jit.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 5417a5624327..686d333146ce 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -2396,6 +2396,11 @@ bool bpf_jit_supports_fsession(void)
>         return true;
>  }
>
> +bool bpf_jit_supports_ptr_xchg(void)
> +{
> +       return true;
> +}
> +
>  /* Indicate the JIT backend supports mixing bpf2bpf and tailcalls. */
>  bool bpf_jit_supports_subprog_tailcalls(void)
>  {
> --
> 2.25.1
>
