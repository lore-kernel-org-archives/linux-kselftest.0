Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB46824BD
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 01:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770081504; cv=pass; b=Ns5bWzE6UWeI97yHeKYyt0MYiTjK9rOxthWhgrvl60EZL4rBMHyFUiCFaBC3SpwxG7Grn729mCn+gDvnVqpsHpd41oP/7VoQCkxxPcQlN3gseU3WpP3cNF+bkybtJ//Ym7c7hsw2DBJd3D5LQM4jpr/4aiNVSkrAtDRlDq5a0pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770081504; c=relaxed/simple;
	bh=Bmmhefj4WNLudxlkW4jKO5VYo++HONTS5JYUhkUAUgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tgo7FiyZCH1f8jlKUZH7Wo1muWJ3HJoE+xjH/nkMsljY4PwLMM79AXx8Omz2wh8cfq/dqhRjDpx9dwC4Ne7pEWaw5cE9C62bkvTSgW3SVg7Zeexlp3zwdBo/5X8VqFecC84qVDuMOogRlffPQcKAcc8JpUA5B248etdYA7YlClw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wbz4nT+j; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wbz4nT+j"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so3510446f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 17:18:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770081501; cv=none;
        d=google.com; s=arc-20240605;
        b=Nam0ZVDOfCUYTr8/knsCGyBCvxWvWJ6OSZF/aqvmyezUeNRA8voF1/lKsAwqaQKQA/
         XXfQeRRP8PFULdriRYR/bDJBwU96yzqPZ7OjTb2ALgDiVqJcosoVtr+iWTnAVCYZj+sv
         ohYCvP4YUQANwYpla8AYw2cF8moac7YNGWhNrBSY+p7c+IJekHf2CCCiGtuPnrcHZ9Wf
         PHeebU8hlABdKNn/PNoU4+vgSY7CEjzFEbBj7cMEbT6YVGX+Puxl5baOvEON6tWF34ed
         Ck+flGglNPcNVP3D0HIE9mHU3MGvXIAKTY2bUYNLHsLclMsJkGvYOaCTpS0IiMlN63Nc
         SNGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sd/d8SeUvWXvlGk9ddIMYzI+tIG2toE3t6Ukc4jQMvk=;
        fh=XjxCgEfpZ9dYqXyIG/tIr5/KMOgSnKLejtL08JjczmQ=;
        b=SujJbzS1vwh0e2yYe/4bB2zb6TlyK+8YJqcnYHltp+2h+E2bGDXw0rGJRosvsK+UO0
         iTA5lwQ5Eibq5ke3/lrNxz7zlQWUzyosHLEETdGDhPE2Ly6ywOZwrql4WanVqjsOfiev
         Byj8fpfk9jZzGgSPwjQbPCBkbo6HSs1OluXTc+w7+vVhRMjIvmS1GaHRTk7q89n1YzPK
         Mc4ZGJ6mcfFaBe/D2OgNIx1Rdv/K7lcQuoz8ISxC19DDXUw6ZVf7p6cuVXBMDpaC8s3g
         hQvd0mVezZ2Nl9lTERWcrWSaDKnVac62K09TDQh7+INLXHWXFvlggXM5owDsUbLhXBEi
         a6zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770081501; x=1770686301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sd/d8SeUvWXvlGk9ddIMYzI+tIG2toE3t6Ukc4jQMvk=;
        b=Wbz4nT+jhzBYIUKsP1eW5DHclBcI9vLSeb3sM1zIRAf04OdeLq7WRWRNOpC1Ci2f17
         +ZeVpJUn+mpJd/8Zbklo4wqB2VSQWQ2WADbTzTNWMoFL5mf85P12AZsgRNNjWCXvpAXQ
         y9MGGAWIg5BAVEwr0A0pXDxz0ff/yWYW6ctpAp/IssyAqmpDYU9aDJUf9a/YG3mc6xOF
         pn6CpI2Oq+yhET/ziaNS5iug3R4i7lDDMj9RkMr1caIrFbF5bj5zsKVfsWAnv2iai9kP
         AnL2UABdLXUC0HAxrvNDHhne4CxG0lQAzSdIwvrdc5bETIMopKCJcG0BNTu/Ei5RA9o3
         2cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770081501; x=1770686301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sd/d8SeUvWXvlGk9ddIMYzI+tIG2toE3t6Ukc4jQMvk=;
        b=xJ2shoISN0/FW3CP5+uwuiaStueZLqgGS/UpSGi6WfyPsBKOG9QxQAfDrzsYxG0tJg
         r7+JC54nH+lMYvxUMesSSJ4gDHZ6NBI6kNd2LCTXcfuj7MK2Xumvv/kByPccHiAPOIxL
         +jvNy/wsQi6xwDqONep/+TQUMRr1ZlZiMbfTkMjx4wekD/uj7Q3NXmEBIpyhtQHbrLAz
         +EcT89Nyr1i+g7boJqIw2y8+O7qx0wqfDljPeTXwPHuwfUuYAyp7/ic7iLpKRtEE9cXX
         LcuOfGxO8QNZbn/53t5JKuqMjijDGK70Z3GkkZA9JB6hxvYQ73fbqazmXpIcaTKlpEc1
         Zv8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRQizuN2bxu7kcqCIR0MdbL6tnYl8pMq9OnbGkjIOEU3eoJ18rN5PeauVgq6WS9nTcBUmHHy7U9k82qabNjNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnd//ZML1pIhaAeIkyJNSFf+RNr72YKj6P2RNNnsxd2QUiNaEA
	n/A4k5K6yQfy+BoM5pHRB6CO4kJsUq89SpGPP32CSxziNoSOx9siEdWhxrQB8AzAsOTjqQuJOXM
	6UnOuD6xpxL2JQjL/IMPyJUFwKb1Fq+g=
X-Gm-Gg: AZuq6aLQaaUmj5vz0iVnWnMJmmykBCk1hgii5oC7+fjhY04tLPbG+JZcpPmcE5+8DWT
	PvxOS1p4R0uJbJiXvPC7Cm9KUOxpHXjMSm4oU/S4t0B/xB51LfNgYJUX10vLpt++PXLe8IbTplS
	mnwUV7KNCVQyGDobWXQhvOGeoSmcfi1wkTmOBjOfp4Yg0oe5CP6ppCSmWljBP1UJUunw/JszyO4
	9h5S0LHW/RMJ9ieKHmTSvaMRuK9LChO8RLO8UxWhu+mcxU/y7NQg3l4+B53xoTkwUs0CrJjBBEm
	sN8KJlbRyWRiRoC+z6CVmQK0aj/T3iNHgztpuoLHdzvbDlAk/jZOX+z6aM619b6GRZ3t65fXKV1
	fszcm/oBFKCspfA==
X-Received: by 2002:a05:6000:26cd:b0:430:f7c9:94c3 with SMTP id
 ffacd0b85a97d-435f3a864dcmr20856195f8f.25.1770081501267; Mon, 02 Feb 2026
 17:18:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202090051.87802-1-pilgrimtao@gmail.com> <20260202090051.87802-2-pilgrimtao@gmail.com>
 <CAADnVQJPFANbYvYYyG3OQdXh4174bGwsamAzD8HZ5f=noS=BnQ@mail.gmail.com> <CAAWJmAaiFAyK+PDLStoR_0sGAH6TeeekPMdOjhKwQ07rUm_oSA@mail.gmail.com>
In-Reply-To: <CAAWJmAaiFAyK+PDLStoR_0sGAH6TeeekPMdOjhKwQ07rUm_oSA@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 2 Feb 2026 17:18:10 -0800
X-Gm-Features: AZwV_Qg8XA7JUMiNc7JyuqWoaZbv30QGWKAtdBVvQXzrT4x-mLO7ytNlIyiFJro
Message-ID: <CAADnVQ+R-A1G7JO874fASUQNvDYuTeWovyvriCPth40Y=oLc9w@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] bpf/verifier: allow calling bpf_kptr_xchg while
 holding a lock
To: Chengkaitao <pilgrimtao@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Feng Yang <yangfeng@kylinos.cn>, 
	LKML <linux-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Chengkaitao <chengkaitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 5:14=E2=80=AFPM Chengkaitao <pilgrimtao@gmail.com> w=
rote:
>
> On Tue, Feb 3, 2026 at 1:57=E2=80=AFAM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Mon, Feb 2, 2026 at 1:01=E2=80=AFAM Chengkaitao <pilgrimtao@gmail.co=
m> wrote:
> > >
> > > From: Chengkaitao <chengkaitao@kylinos.cn>
> > >
> > > For the following scenario:
> > > struct tree_node {
> > >     struct bpf_rb_node node;
> > >     struct request __kptr *req;
> > >     u64 key;
> > > };
> > > struct bpf_rb_root tree_root __contains(tree_node, node);
> > > struct bpf_spin_lock tree_lock;
> > >
> > > If we need to traverse all nodes in the rbtree, retrieve the __kptr
> > > pointer from each node, and read kernel data from the referenced
> > > object, using bpf_kptr_xchg appears unavoidable.
> > >
> > > This patch skips the BPF verifier checks for bpf_kptr_xchg when
> > > called while holding a lock.
> > >
> > > Signed-off-by: Chengkaitao <chengkaitao@kylinos.cn>
> >
> > You ignored earlier feedback. This is not ok.
> >
> It's my full name. Every region has its own customs and traditions,
> so this isn't an essential change.

We cannot accept your patch then.
SOB has to be "Firstname Lastname"
