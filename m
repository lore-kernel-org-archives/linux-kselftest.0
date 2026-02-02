Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C1138945D
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 17:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770055024; cv=pass; b=mYBTdbzhQlYo2Yv4iSnxU9iyN1jTW887A9kINbd/FenLm12w2CdsTUcrFGivbSENGJBr7nel5o+aC9hZrNqr4eROMC8VMJUHup855eAabWUhkSM58cGPD64AGe+Xmd7TKkzFhQuoSAdrxkS6mdqGnCHEYpj/jVWtl1Uj/C+7nD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770055024; c=relaxed/simple;
	bh=CBIS6bueJvuLSLj8HJsOHo5Egd/VTGHz6S5XCH5lX0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KPCvmaSIm6C0XHZotMBwTuFxa+Sp8t1XFetH6iZFzGa/44hw/sfJJ5imq3STMFcfDM6krjcbE9udqmXFShz+ynyuj8wdDnhQXnuTq1R04lI5Py2av403569Hi0kRL4AFhMSBhpdYgHu3j0Qjqe9gaV9cwJ9PU5J7FXNldmlLFoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2bcfDyS; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2bcfDyS"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so34977975e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 09:57:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770055022; cv=none;
        d=google.com; s=arc-20240605;
        b=MjrEk4D8czpB31oMXzJWfUoPj7VKjbCYxvXAJS2Hw0tyx4vEctHdPNNiuHsfAHLtlA
         zmmNOef1mq4dRKnRsLGlB3hc/KiaVijviQQf6OsppsCQcu2DkaKxPwmIOq/cXRjjjrD7
         3ySmPq7hHFzK4eNaQCsdqalk+wqH8hD3G6LMcbomZkQsUlHEnCOCmqVDLhqg2YYVInsA
         +lzU1+dx9Fu42INNoeYIXK1e+HnDh/hMx7LajaUlrE/Tnv+gTGUkgXloqpgy4dYb3Czu
         GDWdSS0YlpzDzYYt2ziHu/BUSwerFq+cAyZdHihgwYa4kXoOY3OFwpsmm1LO0htZsIEP
         NunA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mDEHGLGJqUCy3CksWFbc0eH+SWVMEdfST5IwIJHkik8=;
        fh=BOYN06zpXxbl8fyUuJfHVxaGwuO2cwG8MvFVgGKoVwo=;
        b=j6I0OjkwWWlCVQYC3AJyCe3wNctJPFK1Pyvg8TdWJc/tMxaSAA4QL53EsVgR1cOvUv
         VHPcqiITuZxkn3nUWiXIi0fw3RlQduRGiUi9tRWunKXjxX4IbRQAuW9Ayz9F6MKeyOKj
         9kRV+gAASKKu3eyjMTNv9opbgYnLjltApVM9rnWSq+a+3oPncysN3EDp6jNlfHpKC8ad
         frQ/5WpNo0cxD9jp4AR7Gdl+R9K0uLZvHmtDdCxmlqJd+UxR76+kkCOf0P9JMOo0WkM7
         SDI21SWWtxAZhdjHcmxGKcqBnU1x5dWO8PVW5FwcGIK6DePni9JaNXDLToYvd5wZaShK
         zZXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770055022; x=1770659822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDEHGLGJqUCy3CksWFbc0eH+SWVMEdfST5IwIJHkik8=;
        b=m2bcfDyS2ZOZc1G7MrtVhyFtPdRzlb5KxXZZtFQAZJw5U3l6RM2QyNuLxjGseR1zGy
         A/GjkUVn7pPwtdawMGj+fzPCXjMi/S0Wp0oOJFnFRTFMMvPcGIL4R36DjxyIJUBFAKVT
         5qAj0pZwDJjHpOCtVwSJmUXZAIDD84XNtPszjwCDvcbPRYK1MGjmQwcq5EiL6l6/34uw
         TyJxvSULtB1BRYutBSU2yZAnM0Egp56MspImlXGDm2XyRKq09rcaS5HY8zjgwEm98bU9
         cp0ncnD+TSkU9zotW1Tp6VR0x6gDbjvzlljgHE6lRYAl1ZTOUdttiq2+akY18KmfUdk5
         zeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770055022; x=1770659822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mDEHGLGJqUCy3CksWFbc0eH+SWVMEdfST5IwIJHkik8=;
        b=SCmyWCr3KCZ8HV9mIyg7e5YMXWyP7cROnHLekzJo3Q/Bhk2VSqOfZA3twFT5ei9kAT
         jB1EJ71mbsAjTMr7FDYRt/3J44ph+oTDQ/nPQfrjdQ4j1Ys6xxeKG3yiYUphWfHTbi5+
         XHQJ91w+gDyABVyE/uAaZ+9omMuNvnoAGMv9MAp1EPAB/aTrh9OlC3XHK5m/Jm6k7nCS
         mBdrf9NCL8xgepNshBHMY5LvrxgUXpaCMN3BKJeNd0uEtxG2/ShpJrxJw55EBBoXvRtB
         vFBQZkmJffVJgvkswTZXTYWsBFmhTvWaFIB61eXOVqAo1slt9EDNb7D5XN+MccwGRqsT
         kYUg==
X-Forwarded-Encrypted: i=1; AJvYcCWIK3roQJpNkgyXbll/4GoX5DXS5D/g1SOqMW7lfpxhAuaNw3rKln+HU03ugFnnzPNuFPnx1fKaJ8oR9Aoa2NQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxllJPJOesA6VSQN69bUFtw0tw5aHK/4QTN5EA68VwL8tleTu2i
	lxz187MrPDIBWqi/N3Lvi61SBmx6DS8PbA9e9dIPyzDgC/iL4EoOubldarYwIB43rnk5swqOj/5
	V4o35lMh07k4HliPzbdWewS5+F4HMkZ0=
X-Gm-Gg: AZuq6aKGnXuMdpjC2N7ALsah2zPbm5eanPWbIn5ZC7GMVUIpb47oeUctDKsbKxTPtkx
	dT/OpgtCdfBKsHEceNcmhhrBLe3Rr9vlPhEz/Jw3qggS1G9XD6woO5HTPVhVudGMsLZ/xR+KDyr
	t+xUrlIJVZ0z4zReiyMFAsae6BIGc5pg09dLYky8aZAmPKIOAvLqR7/OPRqJXO1KzirMzrexXmK
	aAKHK0/x6WltcvzxB8akzSFt3crvm1V4NPvUhGR++19dY5zdZTfSjfExkvulzz7aUJ0YQffE7Sd
	TbbLBPddu8Eb+HdlfIKcI0p7CvfG1kNLP9uq1p2vcju27tawM+zGlTg3DEp8oAqKgBh4P3R3
X-Received: by 2002:a05:6000:1a87:b0:431:752:672b with SMTP id
 ffacd0b85a97d-435f3a7e203mr18826439f8f.14.1770055021709; Mon, 02 Feb 2026
 09:57:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202090051.87802-1-pilgrimtao@gmail.com> <20260202090051.87802-2-pilgrimtao@gmail.com>
In-Reply-To: <20260202090051.87802-2-pilgrimtao@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 2 Feb 2026 09:56:50 -0800
X-Gm-Features: AZwV_QjLWojZsKQzqgOComDwfj5JZzvvOFxU7Q4Gk607y5vEuZlt5VDX8GtW1fo
Message-ID: <CAADnVQJPFANbYvYYyG3OQdXh4174bGwsamAzD8HZ5f=noS=BnQ@mail.gmail.com>
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

On Mon, Feb 2, 2026 at 1:01=E2=80=AFAM Chengkaitao <pilgrimtao@gmail.com> w=
rote:
>
> From: Chengkaitao <chengkaitao@kylinos.cn>
>
> For the following scenario:
> struct tree_node {
>     struct bpf_rb_node node;
>     struct request __kptr *req;
>     u64 key;
> };
> struct bpf_rb_root tree_root __contains(tree_node, node);
> struct bpf_spin_lock tree_lock;
>
> If we need to traverse all nodes in the rbtree, retrieve the __kptr
> pointer from each node, and read kernel data from the referenced
> object, using bpf_kptr_xchg appears unavoidable.
>
> This patch skips the BPF verifier checks for bpf_kptr_xchg when
> called while holding a lock.
>
> Signed-off-by: Chengkaitao <chengkaitao@kylinos.cn>

You ignored earlier feedback. This is not ok.

pw-bot: cr
