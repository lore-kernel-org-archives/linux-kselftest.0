Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601340;
	b=VsKtTAel+CPZgcqdLYqeh8wuvrl0PM4zqGlr7tfPpZlYT3tYlfgp0dCquRDQmj7lCBEp
	 CFHHHQeXgUaTwyA2+m6JCAk9lZBY1p4uidc2UQBb6jotHtnkUl6mOlz5TzQZaYYvj5xsg
	 ElPHG3ahpm3iRkeNYqHDLfZ8XxsmLlX4prS3k1089MdF5Xqog7A6zW8lNbrb88TsGa9PG
	 ekw4jY28OBZJKlVnjQ7ER9Y6KDSZH2a4oW0ukgIWH2RpradATsI3QD6YYaNuIjunh9Ktt
	 cwnYKyAUq5sbCtNLmkrPfQBm2WfDtTEPtbEYgkNVnvn/YQ4fc5db4fa0vZs88zg9/Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HopEjVcKVy5WlPlbnxrcDQWkWX0L0xT3AvRN619hsz4=;
	b=UQpj4GScPAt++3ge4XJmjZIwnoQZ60wp34uZIoD4FgTO581ha/+1nWKfn0dkziaTl3zJ
	 2fNpqDf24dF9+kVR+uGICsGJsNxrh/VART3RRAapL5Xk+1NKlQILOJRhDlT0M8CVvE/58
	 zluSIzWIktTADXpII7PzvvgCEm7otHTRjbgt5FzSSgm7tnvoqBqZsJuw7F9QcmnbtHGS2
	 hQnARLqe2pJL8vkoudBCTIAfaLWJcLMuCzuQoHHfXVqIxzj0TaxK1st1K9YKuAQnnl/lS
	 kOwzO+cKGBejgeXYkC0iMdsVH7newFpLewIdONXp0hp22cPL/uMklqtwz5JeCfheBiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OpB7fYZ5;
	arc=none smtp.remote-ip=74.125.229.133
Received: from mail-dl2-f5.google.com (mail-dl2-f5.google.com [74.125.229.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9A8606A33F
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 20:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C9A8606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OpB7fYZ5
Received: by mail-dl2-f5.google.com with SMTP id a92af1059eb24-1ac216daf7dso450206c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 12:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601339; x=1795206139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HopEjVcKVy5WlPlbnxrcDQWkWX0L0xT3AvRN619hsz4=;
        b=OpB7fYZ5oudIYsb91KeZQgQ1i2+Yz+pWWPbfqpFJ0c/wuhFClNklZv6sc4wpmQeaDl
         mUOsbOVX7fX4RiViMDJs2bAsdSH/f7cYI4vJPbL3GaFQcLDk2FVjwuZryQqyXIUMjYIc
         cq8hIvkyFTHYgr64EYJprVhlJq+G0bix/FOaebLcvIFybOfqUcuDl9cx3LTbKx6THvar
         0Sgko3b/NsmmejwxUdRbl7fx9witxeyO2B3kJMMwS2bWhIRQFd5P0Z5zAK4L+w0MZ7Nh
         IqN2OxnSyPaddB0xEhdEs0rSnMF0M6WyShKcYcMK8UgAo/+ut4VgCMY/0f6ljygrmQdK
         5qsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601339; x=1795206139;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HopEjVcKVy5WlPlbnxrcDQWkWX0L0xT3AvRN619hsz4=;
        b=hbj8AyOQaH02XE4ohT5kUhVG7Mzt/UdLFaxpoGmiDaPr93jY5QiZsgzho8g9sBLaUO
         woPzVJPKrZR0wLFFkLyLYHZWuSWOyjTXYQ/1/Vb4TEOXrmkY8vaqx2pqLrn8GvOCCttj
         fbnGoEjlHSfdFD3j/E3UUJQO/JKEKMtr8vBUVqtbkfjfV2hqxmnj/3cY3cJ5A7uoQFwE
         OCFvcXxyjAEs99ZAXVuHcT7n4v0USYMuQeQWwX069BbuUm+yNXfTIQ/aQjkX6AzDB216
         8wE8cov6Ipo2nNOQnxOHfBw3dDmBGXcod/dg18aRyz1548B1hk0rEKaevtOzJMaoMe2D
         GOlQ==
X-Forwarded-Encrypted: i=1; AL+hErFkE+GFrToMdFtP3cQPgi9Xv/e0rpAu2y704cMFTUm634Gbd+TlgH4Tai6m5mxvZ8C9qpN9fmxJwpkkwyMQeKk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AQYsTRVa2H08PvK6DCl9vu04woDwrFSFQeK/3i2xHPJGJNhqz
	AkEe6pGeY9ZVleZoYlnCSicXF8aN4vywFpbfFBbGqjRBCRE9ARzkCJEw
X-Gm-Gg: AYBFou0+hTw9dG4LSY1PORuDChEkeMf4MgHKUlFr+7VxpYIVYKNJ0T91mHaPafVlhPI
	+rRdwz2vP3VbSKAdvK3QRX+LIotO5ObG6Qqr9rKe5tS7j2NQLpIFiSA9rS6o9UVXKz1IfMsBNm7
	IajPk9kImpn74YYrNhpMXf5ohtF6eNwFpZKuQM9EqxpqE83YWmRNEZb1XybDKziIbRsGovw1IBM
	wElrT9mfAUeEaLRKFaB6w+GJ2Wncb9qLBafKjduSsfSxnGeHF41MRgFjTOTIN2tjfA+AYYrjD1z
	19RoeR6gchbOxUiyhCesARbSa/NpJPSds3O177X3bneAKIfCdCUTPO6nWv5R0F4QaLQaFC3A/KM
	DUrGhkBl8cJN2ZRlS4Q3jF9QR80lJujH2J7zX3N/DLr6JIEoFK0dbh1syaVsbTukVKu+jy89Hc8
	GjZneC8YH+b58p/UmRClgvlkSMVG74RWc1++sVAJeRe6Y+Wd1z7aWt4MN1xeCaQAck1Fr1OQ6or
	iHnftsIjNt3ScC0qO0f14PcfJYCBMMSymg90vuf0H26TRnyGxpLKhAbrF4T6yt1XW6t8RYdhehg
	cbiW+RaTN28hBAYhLuF2zAU=
X-Received: by 2002:a05:701b:4587:b0:1b2:6844:25c9 with SMTP id a92af1059eb24-1b5030613dbmr3036601c88.3.1794601338374;
        Fri, 13 Nov 2026 12:22:18 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:67::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm11098622c88.8.2026.11.13.12.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:22:18 -0800 (PST)
Date: Fri, 13 Nov 2026 12:21:59 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, 
	Neal Cardwell <ncardwell@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH net-next 2/3] tcp: convert do_tcp_getsockopt() to
 sockopt_t
Message-ID: <avdxYs47SOZHDU-D@devvm16445.scu0.facebook.com>
References: <20261112-getsockopt_phase7-v1-0-1eb759dd0929@debian.org>
 <20261112-getsockopt_phase7-v1-2-1eb759dd0929@debian.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112-getsockopt_phase7-v1-2-1eb759dd0929@debian.org>

On 11/12, Breno Leitao wrote:
> Convert the SOL_TCP switch to sockopt_t. The TCP-AO helpers already
> take one, so they get it directly and the tcp_ao_get_sockptr() bridge
> goes away.
> 
> The options that re-read optlen to get past the sizeof(int) clamp at
> the top take it from sopt->optlen instead, so optlen is read once.
> 
> Only a user buffer reaches TCP_ZEROCOPY_RECEIVE: BPF's sol_tcp_sockopt()
> does not take it, and it maps pages into the caller's mm anyway. It
> keeps checking the bytes past its struct with check_zeroed_user(), now
> on iter_in.ubuf, and a kernel buffer gets -EINVAL.
> 
> tcp_getsockopt() builds the sockopt_t with sockopt_init_user() once the
> level is known to be SOL_TCP, and writes optlen back unconditionally,
> because TCP_SAVED_SYN reports the length it needs and then fails with
> -EINVAL. This mirrors ip_getsockopt().
> 
> Every SOL_TCP getsockopt() now writes optlen, including the ones that
> did not before, such as TCP_REPAIR_WINDOW, TCP_ZEROCOPY_RECEIVE and the
> error returns. An unwritable optlen word therefore turns them into
> -EFAULT.
> 
> The others stored optlen before optval, so an unwritable optlen word
> stopped optval from being written. Now optval is written first.
> 
> sol_tcp_sockopt() and sol_tcp_sockopt_congestion() reach
> do_tcp_getsockopt() through sol_tcp_getsockopt(), which builds the
> sockopt_t with sockptr_to_sockopt() and stores optlen back, as
> sol_ip_sockopt() does.
> 
> copy_to_iter() runs the hardened usercopy check on its source, which
> copy_to_sockptr() skips for a kernel buffer. BPF programs call
> bpf_getsockopt() from the receive softirq too. On the vmapped IRQ
> stack, the check then takes the lock in find_vmap_area(), which is not
> softirq safe, and lockdep reports an inconsistent lock state.
> 
> sol_tcp_getsockopt() therefore calls do_tcp_getsockopt() with page
> faults disabled, which makes check_heap_object() skip that lookup.
> Commit d319f344561d ("mm: Fix copy_from_user_nofault().") added that
> guard for BPF and kprobes.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
