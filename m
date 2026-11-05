Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896771;
	b=j1+rjoYGic+G//wt+BDYaCCi4iNFGWxt33qa/k6oDIWODnX7KnB5b2wSoBW135ZEjT1H
	 BrKlmrV6OfKkqFnMRhoWh0tCDAQ2P8QXEIV3HQWbvs4rJZFoabq+p0r3imL7V+WBDpN/N
	 sQG+XD3S6vYf370TbVNcrYQp/eOFFG+AJ4rw0flq6XaJWD+TB2m4R0vRB2+H0xXGeCwHz
	 JotHYwhfyyYdfC9xi7v4/vwdWdyTldIiInYrYdRlU8j2dRjaDHrcfmPSvUPABAcYEAbeE
	 CX1Jbvr6GUVIBYJMMd5aAefWHB7lG1uLw9tuGV2VLM0wCDMTNWLvDqXQ8kelp/kWUYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=g7fNqjHpYaxkYpPES1WMA+c07Ra73ql25qOjXSvqWMg=;
	b=mnc19TEJZ3KFK1jQ1EIF9cj+nWjdTe3785yNQ/qACQ4P0Ea7WzSBqlOkwuXHIlbdzLBE
	 mJMK3dK1osZey53Ch2ptmb1pO3II2aOgeGHEBI99SrV8/1gs/RWTycDQvmZpB3qjj/XlW
	 BCvHw3vw/TffjYh2Mq3ZMWeCq8htc4P6kFmzQ9NrhoxK85lY1g0ywxcKVDheQe75xTn9J
	 TiN/5+4oCi1bWJJVKtT+Sym2jdQ33a42mERNIkBZJhOdRDtLAPpMCEkQ4B6kTqKeXvlKe
	 0v334ujD7de/GkITdp9Qbv0swdfTMGUC2xaDcEOKihEcboygxim/zFarZN/IjKU8kNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Do+25Wfz;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECA5606D80C
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 16:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ECA5606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Do+25Wfz
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso1452426a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 08:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793896771; x=1794501571; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g7fNqjHpYaxkYpPES1WMA+c07Ra73ql25qOjXSvqWMg=;
        b=Do+25WfzhzV45gI604/1EZvOaKh/pike1eqCQMpc8ex4jx1pAN42T46xblK9HDKHB7
         KBTnLQs3xSuJSR0+hEgKmeAUNfW7AALEE1T+rKSR8y/Wr6GUmZX+ZXbk0/jIIrWIb34e
         Yw9LpdxIJ6RYaq5C4Wj70gFPr5PfoFNw9Wj1rtSjpwyfXfGgNxmzpEWd+pGHumtKX+QO
         k215Bah+78+AZwfWVSUOu39cXJM1slYWKsGxQY1UQiXMh04MxQ3RMSH5gZw9oEmKn7eL
         2b+IzsuxrHs07AWt0ROurkw62JUn2qAQga5a3MNxjUfuy3Fj7jBTvPwu5jCADAyjs7gl
         zT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896771; x=1794501571;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g7fNqjHpYaxkYpPES1WMA+c07Ra73ql25qOjXSvqWMg=;
        b=u/MHizkmOvyuMFuzerK8f2bGrpPMoDUz7S6yKmszdMXNtxYOWCfHl+1c3J+rhuROQL
         wPKFDqjbDqkb63luBpnLLz/FrTzEHV5+py3K/rMddffYEJmLe4KVoRq4fsVpancvmfiw
         IM5Y1lgzoQQEUkWzACcJ0q1wzfTzv3L8/rHL1jfYHLyN7T16cvSmZpHVm2NiGTiKUgbc
         dLI3r3+uibqngcteqd4C6APZrRPYXfDepFX6e1kGW3fkogkGwyImJJNwneP8RfCaY5tT
         CD8cy8/D2Nwfi8s+X28jSe3odI0dl9J3DhTEBoqvWJdOkMA/5QnfeL9Ns3qRD7w9RYrL
         YlAw==
X-Forwarded-Encrypted: i=1; AKwUvBwczi7rwE2CGaxxDSrljM6Q+BUf2xhHdvDxwl8bO+PRhUq1SCpGIFftaBeEVUlKo6z4e1Vhf9czEkdVzBTdLJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ANlMs2R/jcoqdXdmCX+WdMGzfUij9NV9Zey4vq+Is+hk5j0Ap
	yvvpiuRjQdXaTcyCC7q1TfksVSjUiYjDwNkaJZtMN27/H2GY7Wf1u37S
X-Gm-Gg: AYBFou0JUVytgRmS+SVbG676iAOwe+d7xZ6hPjW1mf/LvV62Cyc1xYUviuob8952nqe
	+HSlLdGyZ6LrEQ7hiCOpZW4wbDRfMZD7ov0xRiExg2QpCs4Nzbhy8wRna9S00Jyys7Js493vCQX
	TXJjmdVxKXckEPYl19mhSylydH+rOXSwNexoEe0XVDeueYNG5PJNfLbrYgjJ69VamxS1pcdluDg
	zxfgP3KwX5/0fUgcFws7R3s8WfOUjPXmszhjCqTQsdMyg5WQAOuVH9jDJ4AARk7rl2axJUv05EX
	U2fhSFmh7qIZXwSbkuwt+w+JCkDYDW5Vo01S9EZAi7Z4/MW0hftlYhlIL2vqSom2Y7xYwdj1V8P
	gPwi6pD+oQ/LHb0+PwsVhVUvI05Zh3ZNney8LeEkoxT+5FTJkOP2xWIKo41siJqB3uU8zVNi5u7
	8HVSapyP3qL0NkhzlUBcgHlHS4KHy+4xOBLnopnZyGEM/SWtuh0u+qG7akLZHrbZCJS5W5gay7h
	oSsxx8WCo6pZHdiQcQAH9MdwJtqwRmV175rMZ6kA6K/WiNY4gd1QlvVLDn0mR/+7iln6C4UAsGU
	HI4WTb/E8M/LKXhX1bP4NS9k7yJjhkDhXeZwlYvzUfaNrj9SIR6AQU9EuayQoO7KvCvFt9lCfe1
	02rHx0t0lGtxV6LZ5oAGbZNFcrvbLyKRg0tI=
X-Received: by 2002:a17:90b:4b8a:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3ae89771679mr16239176a91.44.1793896770403;
        Thu, 05 Nov 2026 08:39:30 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd47sm4574863a91.6.2026.11.05.08.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 08:39:29 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 16:39:29 +0000
Message-Id: <DMNFBZ04A7IE.1AX8WZ52K8DT8@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH] bpf: Add network namespace boundary inspection kfuncs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Abhishek Khade" <abhishekkhade69@gmail.com>, <bpf@vger.kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>
In-Reply-To: <20261105121642.38019-1-abhishekkhade69@gmail.com>
References: <20261105121642.38019-1-abhishekkhade69@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, Nov 05, 2026 at 04:16 AM Abhishek Khade <abhishekkhade69@gmail.com> wrote:
> Currently, dereferencing task->nsproxy->net_ns directly via BPF CO-RE
> presents safety and architectural challenges:

No. The prog does all of it today without new kfuncs:

  inum = task->nsproxy->net_ns->ns.inum;
  is_init_net = inum == NET_NS_INIT_INO;

The verifier accepts these loads in tp_btf, fentry and lsm progs.
A load that faults reads zero. It doesn't crash.
NET_NS_INIT_INO is uapi. No need for the address of init_net.
For a socket it's sk->__sk_common.skc_net.net->ns.inum.
Networking progs also have bpf_get_netns_cookie().

> +	rcu_read_lock();
> +	nsproxy = rcu_dereference(task->nsproxy);
> +	if (nsproxy) {
> +		net = READ_ONCE(nsproxy->net_ns);
> +		if (net)
> +			inum = net->ns.inum;

This is a use-after-free when task != current.
So much for 'this is safer than CO-RE' :(

pw-bot: cr
