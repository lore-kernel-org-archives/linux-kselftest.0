Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87217346ADE
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Mar 2026 01:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772500523; cv=pass; b=Y4xbz6vZ8VwjDUQQcuWA78MRCHEjdAaYnti7kXMJJuAndePm8g8BiVnxFIa2kLH2uydWLZmbadByXO5LaqHpxpTFkunQ/q88F5eZ/RVYwY/odOUvdjyMjOoGOcVYrGznANnfkO1j7pdVxKviMl72OZ4zITr1Bo2Wkk0CK5gZNdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772500523; c=relaxed/simple;
	bh=j3CKEPZPsZDOQO7eZWdGZhyLgT5/sWBfMGLt9ZQm9hY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gCxJ4uRx5FrQb9S4jYTaF5IVnS4s8K1l9ZvXhCcTYVtmukxPBxeDTqtO/MEhqAsdKmRzTTJLItAGGiLQmXqZVvPLPFeD2xrO1NWbYFS4QyvH9Vr8ZLMozlG+YsZuXcEZSWl5LhC6ZcH7v3mZNrIimD8CkxoW16AOLYsydXwNj4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eqc/TXcI; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eqc/TXcI"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c70bb8ffb24so1838289a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 17:15:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772500522; cv=none;
        d=google.com; s=arc-20240605;
        b=kDq3qXXO0DCpX1zBnxWqMji/7eGlhuVbAN0sEt3gbR8EvltOVNauBx8U8F9tOve+TL
         gfoTsLIoEI8oJVI+UrMs5c4Tmk7whF5BMKzW6ZaOC/YTaB2vI0XUXXXnsQa8xe6wkcyY
         AOvO0QcJqjYsEbyA+Wj5XjmTaRUeqLkMaAcULZ5hDyxsTFuzqp2bSGLVAQJsHjgKyQsd
         1UIR+NHTpWchx3COkSlZnpfZkqcBz8jmPNrPVP8UzzPCwU44rk89jo19ELiiIFUHKzu8
         LREb7ZzGLRE/2ldTZnKFBBuDVBuq/AJfoz5o73zpT8QVxgr2BFcfdQNX0HC85pWV8eoJ
         j8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oRYoOP/AxXhYElkBcV+kPgi4ZqfN6Vv0Q6Lw8WBNcpg=;
        fh=Meq9lT5PALprbArreSEI77NZOtLTt0Z2Z110qpoBm/Q=;
        b=QNv+Li98LiwkY4aMeIFi5MClDzg91Z0SLOPbEzbW9nZ4+YHWLfow/orJUYFaRgoGuV
         ZQ/6rFUYkrx5WxG8PknjOP5I3913LfCsLYi6/gCOrfak3THu1M5TKRo8n8ILOHGg+lFi
         xUEWqV4jKe05iW46Iadi4+rKkPx19yH7p3Eih+fPw5M0D0NyHsx3Gt/GRAsINj6GpZNQ
         zhn1J0KEJ1wv1Pw3oZqRZUkOZOkRuxRStuI1yMDslGg7w/jbYVnZ73FZGobZ2GNaUkq2
         gOqHzDAZvIIFRqYmkcfe+4Y1ok5pGcTL6BKRvTEIi+mRcNqHFyARIknf9M1VvhVzUSd/
         ACKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772500522; x=1773105322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRYoOP/AxXhYElkBcV+kPgi4ZqfN6Vv0Q6Lw8WBNcpg=;
        b=Eqc/TXcIngKaAuTfJAQZeuGZv3nbeikn/Xm/xPScpHuZIErkz1q6Vb5qZZJP0tPnc2
         stjldNvAZUJkETwOrx7I45ovdyikLwz5sH7DnVVbwcCVU6bFLrXdFRxCzsk9nbKlQOxV
         Sfn+KxYaT756tSHrQZfoB4PYDxnwZBOsFcDKRhCoDLLTXOln4i1+jJDI+IfJ7FlCaJJw
         wdwVD+JvFhIwehMoM6Xy6Ry3/wdqZABnuhVyVppjskanOQG0Q1Ah3V4Sw8Fef8wlHoKh
         QWNtlM/1+BlQk/4ODpj7eHipcW+ffXrOBxfq4ghQGPo903jjIkaezRO2JVhsLXL7TChY
         kLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772500522; x=1773105322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oRYoOP/AxXhYElkBcV+kPgi4ZqfN6Vv0Q6Lw8WBNcpg=;
        b=FhxhNDvGvepZblkkBJ9AlUvr1tAlavsnsiwOuezm+fnfhflc589rCtLgEKh4vx5BYM
         lKkAy8ZUKXasID8xuwnBPAetcMNYwW+xdtxlvima2LOkGeu9J0imZJ0kBsVWAmdXRZkd
         J/gkeu04zT5tIA9vJTlBHueANC7+Q+TR6zqA6DJU7SQLm08UrVYa9VoG6tEHiAM+uwle
         0PkZpDedaRN1m9HkDv/tMX9Jj9M/19aPjsEvyHtHYs+JkMMgxYI3L2DPvY1gpJu1lzF+
         O19V/eeHBln1C4d1QACPBPm/8DY4ai8Nv57zFCruW9wOQH2IDuLxc6anoKAbCAdXD+fm
         yScA==
X-Forwarded-Encrypted: i=1; AJvYcCVTMx9ZLT56bYZVSIjKSzVlbMqwE8JngzeiK/fR3qDnHS0CaMw6iXX4o2nKjQX/OA3zpn8TZmzrIR7rZcJDwK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoYSGpJgzObHpyMiPAjKE+u2DY+3yftUydNDyqC82FKo6wztP5
	/J1+q+iiDDkk4Wke0F259P5qIyBpPCI7n3f4O8tv5mmbPepLnU6JK2syI/kQy37RtqWhgCZ8lNs
	m9EK1pJYipDCIG7Yu2zfMyhoDf5y/qN0OUfGRIuw=
X-Gm-Gg: ATEYQzzuNQDmzbvF+CjV+UpQ5v1JDrkHyExmiSo6hhoeTFwDeODy5faJyVKtzTs7YHs
	GNEUOXfXryA9XrBavSaHJPn5MlID26ERQtoFgCNp0nLvRkoWe55lgffk8b7awM+qlpoRVH77njE
	m4DnKocy8T+La55EbkeRskLcxLDp4wf+eLtPoQ9lXCGaatyw9zF9nRy+ZY5O64NjvyTanDtjx2y
	0ZozanCOmNrgSeK6KG7AeGlIPl3s6fFcY5cjIYSaBT4AIgStpHD3WFXuULJPAJnoa5mLEVRwYR3
	XzUVe3E=
X-Received: by 2002:a17:90a:d408:b0:359:95c2:b3e with SMTP id
 98e67ed59e1d1-35995c20e6dmr2526045a91.30.1772500521717; Mon, 02 Mar 2026
 17:15:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302124028.82420-1-pilgrimtao@gmail.com> <20260302124028.82420-2-pilgrimtao@gmail.com>
 <87bjh6ntsr.fsf@gmail.com>
In-Reply-To: <87bjh6ntsr.fsf@gmail.com>
From: Chengkaitao <pilgrimtao@gmail.com>
Date: Tue, 3 Mar 2026 09:15:09 +0800
X-Gm-Features: AaiRm51bdAD-IerN0W9Z2z0y6DQwDknHc4UQ1wwMaHwAxgCFkvOMMNrs2B4XKNc
Message-ID: <CAAWJmAa9_RcjbHzOmufL12gfoNY3eZtgWGjNTVR0sbCR9Simkw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] bpf: Introduce the bpf_list_del kfunc.
To: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
Cc: martin.lau@linux.dev, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, 
	chengkaitao@kylinos.cn, linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 11:19=E2=80=AFPM Mykyta Yatsenko
<mykyta.yatsenko5@gmail.com> wrote:
>
> Chengkaitao <pilgrimtao@gmail.com> writes:
>
> > From: Kaitao Cheng <chengkaitao@kylinos.cn>
> >
> > If a user holds ownership of a node in the middle of a list, they
> > can directly remove it from the list without strictly adhering to
> > deletion rules from the head or tail.
> >
> > When a kfunc has only one bpf_list_node parameter, supplement the
> > initialization of the corresponding btf_field. Add a new lock_rec
> > member to struct bpf_reference_state for lock holding detection.
> >
> > This is typically paired with bpf_refcount. After calling
> > bpf_list_del, it is generally necessary to drop the reference to
> > the list node twice to prevent reference count leaks.
> >
> > Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> > ---
> >  include/linux/bpf_verifier.h |  4 +++
> >  kernel/bpf/btf.c             | 33 +++++++++++++++++++---
> >  kernel/bpf/helpers.c         | 17 ++++++++++++
> >  kernel/bpf/verifier.c        | 54 ++++++++++++++++++++++++++++++++++--
> >  4 files changed, 101 insertions(+), 7 deletions(-)
> >
> > diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.=
h
> > index ef8e45a362d9..e1358b62d6cc 100644
> > --- a/include/linux/bpf_verifier.h
> > +++ b/include/linux/bpf_verifier.h
> > @@ -261,6 +261,10 @@ struct bpf_reference_state {
> >        * it matches on unlock.
> >        */
> >       void *ptr;
> > +     /* For REF_TYPE_LOCK_*: btf_record of the locked object, used for=
 lock
> > +      * checking in kfuncs such as bpf_list_del.
> > +      */
> > +     struct btf_record *lock_rec;
> As far as I understand this patch introduces a weaker type of
> verification: we only check that there is some lock held by the
> object of the same type as this node's head, but there is no guarantee
> it's the same instance. Please confirm if I'm right.
> What would it take to implement instance validation instead of
> type-based lock check?

Your understanding is correct. However, I haven=E2=80=99t come up
with a better solution to obtain this node's head. Do you have
any suggestions? Alternatively, shall we revert to version v1?

https://lore.kernel.org/all/20260209025250.55750-2-pilgrimtao@gmail.com/
