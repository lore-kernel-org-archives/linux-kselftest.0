Received: from cvsmtppost03.nmdf.navercorp.com (cvsmtppost03.nmdf.navercorp.com [114.111.35.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAD638736C
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 02:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782183496; cv=none; b=bSKvPvKXO1sXyEUg/nXF7e/FsxAUMqYox9W72G68yUC0FF3DO8QKA2pFY3JpzftC1COBPojHDvDLMaB2ggtjcE40GVFHGGiduMrpnm6zUuAKxJvZy157157xdYC/ASpk7CAd39tooOtXqDbBMQr5lPib/qMmtwhCfZ/r3XunErw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782183496; c=relaxed/simple;
	bh=PgCIy0qQP20ph1Rm6sKtJRt/8uIUAhmxKHvUba9VM5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eMGDbJXGQPCBy0jPItIzAVlhkOUa4sztdYplxkYiQEMk3Up+lYPK5vwzy7wGQPsEEfgSxKOti7iKSwi+wGoQig7+AqhjF2+GvRFd825f8dScpO5vKdvVh3jbbUdW7v4Trj+lMzvgju+t/kMKzx2GZLmJzp9SycPQ8Q3muHF3FwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=navercorp.com; spf=pass smtp.mailfrom=navercorp.com; dkim=pass (2048-bit key) header.d=navercorp.com header.i=@navercorp.com header.b=Qub6geea; arc=none smtp.client-ip=114.111.35.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=navercorp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=navercorp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=navercorp.com header.i=@navercorp.com header.b="Qub6geea"
Received: from kr0s-real-1 ([10.180.30.112])
  by cvsmtppost03.nmdf.navercorp.com with ESMTP id RnbGf42MSL+i7bmUztWrHw
  for <linux-kselftest@vger.kernel.org>;
  Tue, 23 Jun 2026 02:58:12 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=navercorp.com;
	s=s20171120; t=1782183492;
	bh=PgCIy0qQP20ph1Rm6sKtJRt/8uIUAhmxKHvUba9VM5Y=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=Qub6geeaNeGR22KuiymRyXHy40QpLwByUU4ZZ0dsCEv1UafEYICgOIHMI9P15zPo3
	 C3+4MYgP1M9fmaqwmsBKCTujQSeuJFHtI5hikhETQGojf/zmZi8oQvfs37Gw2ZwsZN
	 YuwETxvRoAeUWbBTz6rqp51LSvj8wivHqD/8wV1tN2ZfeL9nPDOgKJfqANk/FylyvL
	 zzo4f7wiq9DDDhE7CsBGYKsoayAEBO+XNluuie/vxXWisynAnY4ZHjixarcg/TJnet
	 hjCQ6wkb6dXI5ogEB2NxTfDZRR2mREQM0oAehCoIVRnyr4ZzQTekDUVg081sjTgdJ+
	 cq8yJNqI1tCCQ==
X-Session-ID: D3+Ngjf1RSW6W6+sQiKAKg
X-Works-Send-Opt: TrbwjAumKAumKAbZjAgmKqKXKoJYFBmwFNwYjHmm
X-Works-Smtp-Source: /wn9KxU/FqJZ+Hmmaxgw+6E=
Received: from localhost.localdomain ([10.25.115.253])
  by cvnsmtp01.nmdf.navercorp.com with ESMTP id D3+Ngjf1RSW6W6+sQiKAKg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_CHACHA20_POLY1305_SHA256);
  Tue, 23 Jun 2026 02:58:10 -0000
From: Gyutae Bae <gyutae.opensource@navercorp.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	bpf@vger.kernel.org
Cc: Gyutae Bae <gyutae.opensource@navercorp.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Minsu Jeon <minsu.jeon@navercorp.com>,
	Siwan Kim <siwan.kim@navercorp.com>,
	Jonghyeon Kim <jong-hyeon.kim@navercorp.com>,
	Gyutae Bae <gyutae.bae@navercorp.com>
Subject: Re: [RFC bpf-next 0/3] bpf: compare-and-delete (BPF_F_COMPARE) for hash maps
Date: Tue, 23 Jun 2026 11:58:07 +0900
Message-Id: <20260623025807.3119-1-gyutae.opensource@navercorp.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <DJFXOGFS8DXY.4CDI7LHXGHWN@gmail.com>
References: <20260622071649.31541-1-gyutae.opensource@navercorp.com> <DJFXOGFS8DXY.4CDI7LHXGHWN@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon Jun 22, 2026 at 3:32 PM PDT, Alexei Starovoitov wrote:
> Sorry, this is no go.
> There is bpf_spin_lock that use can use to synchronize access
> between bpf progs and user space.
> lookup_and_delete with BPF_F_LOCK uses the same lock.
> Or add another syscall program that is triggered from user space
> that operates on the same map.
> Or convert everything to arena and use whatever algorithm you prefer.

Thanks for taking the time to look at this, and for the pointers.

That makes sense. Using bpf_spin_lock to synchronize the datapath and
user space, and driving the conditional delete from a SYSCALL program
(or moving the state into arena), stays within the existing
programmability model instead of adding new UAPI. At the same time,
it still lets us close the conntrack GC race we were after.

I'll explore those directions rather than a new map primitive.
Appreciate the pointers.
