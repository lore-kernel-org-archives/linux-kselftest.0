Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BE533E374
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 00:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789605401; cv=pass; b=Soh410/5Gogl1oV4/F0kFphwAGKj15PaUYm7xIyaCxMSycSkQOY/IPphZfYnvWp3jtU7cTj8VAb0rCnyvApZ8+7yzlRSZrHdrWLd7jem0KypZ3ZUEJsCbcsY9GA38M6QYxiA3jwN74NPI1ZrM9aw6NMFs8EhH3d9xAJAoCjJgNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789605401; c=relaxed/simple;
	bh=ePVneiu8f7HOysaEQkzPf7UPOZIwpLI2NG8wQeL1rIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kdZaz6SAP+kHRWe0I63tqW4ZqUMvk1K/ECE/PMwo/22dolV2b9u/qFvp2AxdLta04kKswRwi5vi6gCdhFheXmaR82YG/08F90/dBwxF5MenSsuu4OLpLyb+Uj8FhKoe8KHOIOu16EjO3dtSuxdzCVGi4KuYtfMSvqcmJiUL0stI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsogayB/; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsogayB/"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-868cfc5c244so150885b3a.3
        for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 17:36:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789605396; cv=none;
        d=google.com; s=arc-20260327;
        b=bZvFVWSQGTbOUsyDzh37HxqlZ+YtqHny9LwlW+CsKk5dx5DJh/+rntXLtMnDvmDHL3
         COLKHTBDUabPYbPvADW5AI6Ab/EKrBntDxOyILLk3X1xLDVz060V8LkqAF66SPpVqLKJ
         ZnEoyMOefckO1Ijihwz+Ni9ztoX3CKfqWUFgIKlSEViaMkfMNhVBVlc537suOTqrK+LZ
         PqmC64UXVbcVgzHGLw3j1pcdab1rrYXfQ4x3dE34VklZ1cwI/THs6sJBrHz9d/TA/fZk
         OoS2rVqzQ97/c3m+gU7rwZpn+RXNAfRdtunWDKzJLR/1u6QIpUFD4QIqfASfU9Z07htp
         beOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z3t40gbdtLCD1G2xLbWdqCI7O6nv21XGGKYIiPoR+Ps=;
        fh=hZtjmx8qL2dH1qU415ew7KxptP66rwk+9fBlu+aGHzY=;
        b=mUTlzszBqm1Ad23n4wGH9jaOFy1xDTAJ4ULAYMUpz1MezjC3IW0zO/7jbDpHhlh+ZM
         Vgihu75a5B3X1NUNMtUsRybjh1mvkRxUvev0uf2O8hbHWyuWIMnzkZPs9Xcegbkgwxyh
         oyCnKZa8fUIasFnvUGmVBClI7mqI3VBUl2ht0K98xQO58oXnR7lWsaML2/1/xSss4M05
         0rKliTVYedY4MG90oAWXAM+YFnlCQgrMQ7mr6tk7VNpfItQuNutxBvVrVyJQz0xAms8H
         uNf2vHVQ6FHOtNPUYtLNGvfmgV74VvM8eDnbUvpxFsZGgedWuwPYBI2mLHssasA7PCVb
         dQPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789605396; x=1790210196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z3t40gbdtLCD1G2xLbWdqCI7O6nv21XGGKYIiPoR+Ps=;
        b=TsogayB/+IpRHhnz2DwNm62FAk2EHgYbawS3Z6sx3RD2VGhurlv6sJhlNn+T+9zbx0
         COknBFb2b681fvXkln/uR1k0d36lT9jeKImG72cHiS+fGf2sre496ZD+A95YwID5vWjN
         RFt4NQKI2IPOMUPnjYDaM6zGfbWAB/yD9Bx42V7nM2lyjiW8wHEQTr7yqfkviGfzn9S6
         uQfO8chLF2isgWfqPI9t5sar7KMbSUzPNa4u/3wdGXbFAJADOoGYJBfkqYcVUeTazVTb
         KQLI3TKayjbQa1QSzRxEJkfcB94tk1o4CbnrGk/Tk4C2SZBN/LIHxEJ3CbyY18jZE9Om
         tT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789605396; x=1790210196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z3t40gbdtLCD1G2xLbWdqCI7O6nv21XGGKYIiPoR+Ps=;
        b=RTWmzew/hMili84UmA4ziGzVdiUxhEJmSFsYROqzIQUFoAD12Tir2mb+3pjgKN/Moz
         X1VYHmfLQW46LdmrzAENRw0kasXAbLRiAiXKjsH48ylUaKXnHANaIZoVTkDEbBBFBnb3
         SrkdC+24B4z9SS/boOUEDvYzwXANNNHu4eU4PufEEyZ8DQKNnDLXkzRLTdGBDZBgKirz
         el/HmEQL8ZHr7cxnQhmsHi8vQ8VASBmUCrK/G16oihEGE4dGJHKZpmGTEvwfhy3aExjN
         xzm67ZinIW4JJcK0V1ypLIZzQfYKWsimWads8me/buyTnVHIzMtkUg238xpb5AKN7sIw
         KyHw==
X-Forwarded-Encrypted: i=1; AKwUvBw9sAqfc78vrgF460X/jj0gUgMUtEAyAhF5lbsO/x/ikufcHsXxKi/Q9lrTDvzFEGuR10jlHiBekGPJhBpRO5w=@vger.kernel.org
X-Gm-Message-State: AFuF++lLFtIJgBHyvuDJ/FKdD3B45BdiTP5aQDq3f6pJZjYWGVQ/bYo/
	ef/b0vX797hLuUPdHTsIEAN10LvpUvAEGO61EKEMxgu8YHCM8ARQq6tjEPz2vCHdWudyl6UubkW
	YupJfXOFqrDmaMK9RFzyh2eGHilQUktI=
X-Gm-Gg: AYBFou1cwR51xom8EtQkQ2MHwC+uF89nOyPyFv3FmhWQWIFM4+pmaqpXazkliCURNip
	rQD0kfkEA08SH8cwo6EO1Nw5nvluVNee6eQTayS5tAuynz4QNOzK37n1hj2XLO7htZnyjizUlir
	K20YIw6rFRGboV223TFPmiclQ4ntOquvU1x9iYuWWIQzErj+9M2ybPCDjyJECUj7EOoIEj3ywj5
	Gw0Cx8IIR0jK8ighxN1YSrVQEGjbBczhZ5fL6/xNSA5wzossbp0KW/BXMURFtH0I+hGo2fF+JhI
	gZLRQ/nbh238VJux8NR/5d1p6isAO9FQB/bhX+VVAYj+Qper3ootBkDTZuMNC9Xd/GtgrlBbdXI
	u7vGWOINiBa3eW+kC9PTpe7NWbw+gXwktlSfLLoDPF7l5/Rk/pWZc
X-Received: by 2002:a05:6a20:548d:b0:3d2:df:1854 with SMTP id
 adf61e73a8af0-3dd5f403cd9mr11548203637.6.1789605395452; Wed, 16 Sep 2026
 17:36:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910164635.459558-1-vineet.gupta@linux.dev>
 <20260910164635.459558-2-vineet.gupta@linux.dev> <DLDKB6BTHVXE.PFK87O3QY1J5@gmail.com>
 <f575fe19-a5a0-4f43-b1bd-cdec2c6e9830@linux.dev> <DLH1MDZPU5G0.228555JR34D3N@gmail.com>
 <76ca0a2e-dd9a-41c9-90e4-5fd3c9171172@linux.dev>
In-Reply-To: <76ca0a2e-dd9a-41c9-90e4-5fd3c9171172@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 16 Sep 2026 17:36:24 -0700
X-Gm-Features: AcwNN1XO4HwAR37E3WIkB8E7DX_-wst1NccGMR8T31Mz-rEIep-eXEJg6HLexr8
Message-ID: <CAADnVQKKWBV+pFMAStB_-POKveeO83RiXU+VKeua3odSu-Xrmg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 01/13] bpf: move linked-scalar flags out of
 bpf_reg_state->id [NFC]
To: Vineet Gupta <vineet.gupta@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 2:24=E2=80=AFPM Vineet Gupta <vineet.gupta@linux.de=
v> wrote:
>
> On 9/16/26 2:02 PM, Alexei Starovoitov wrote:
> > On Tue Sep 15, 2026 at 1:17 AM UTC, Vineet Gupta wrote:
> >> Back when I started, keeping it NFC made more sense. But with all the
> >> nuances discovered in the process, I'm inclined to drop the NFC stance
> > What is NFC ?
>
> non functional change aka refactoring.
> Like I said when I started I wanted to keep the id / flag breakout
> purely non functional. But given that splitting it does change one thing
> (mentioned below) - I'm dropping NFC attribution.
>
> >> and make functional changes - there's at least one which is the
> >> following accepted pre-series and now rejected.
> >>
> >>         old {r2.id=3DA+delta32}         vs cur {r2.id=3DB+delta64}
> > that's a red flag, no? The refactoring patch shouldn't have
> > any changes to selftest and veristat numbers?
> > Unless I'm missing it again.
>
> Yes understood except that it is no longer refactoring.

NFC is gcc probably lingvo? In kernel people just put in the commit
log "No functional changes", so it's easier for humans and for AI
to review patches.
So pls skip such unusual tags in the future,
but keep the first patch as "No functional change".
