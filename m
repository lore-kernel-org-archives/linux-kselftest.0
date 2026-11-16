Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794861418;
	b=shqX+2uo4kdRNd/LsCoYQGoslHmhBCoSm3+5HQ6ZopG2pf+bq8x2d7Vi8WSiOdw5odd8
	 qhJkegFmcUCmzM7SSuBGTsZa1et8PV62+8sxEL5aOivXydijd9gHjS2Kj6DnEJdb+hWqI
	 SO8gnUAboytNIv3PYX41BhGCEv53TIziUoHnP7K3kyp3F81YAvQgS6atFrSH5lFNmoNbB
	 DVktZpIpIv8wKn8R9aLE5RPrZAarsJGGAnLTnmMTjJ7BqonSSxbLC7AtjEOimNkyv022w
	 AR15GbU5o6Cu6SUKAMv7fkNHg8a0+kiuGrvMgA40lcFdna9fJqJclHAuPIfuZ+5EtoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tJTXcb4kfDqNpUGLwGWYlWQVn6Sv/SOC+HXp4SSgoC8=;
	b=JSZCN+11ICLdPk7/kmeQ8WNJ/09SZldMwOWf93dcDw3spTib8+Ax9/OJZDm5PJOOSGsy
	 1qUGuPHAq+7D0MfXk1gmvXcQVPhdX4p58d8/L8NUHASVsyqlRvbp1Qd6FW4mSVYXM6Y4/
	 fk5y2QXGqIoxXoW/mxqNbMJmpbb8SuKdHQ7WQ4imeyfygoUUcbrAKDzeokQbpD+5ljNYw
	 MO29KwDwow17yaw9vyvSpLDjc0246R0lL7vzcXBuTqcjwa0KRcsLEU43RumSB8Prs7s9K
	 BmZ/9hSfEC4SteL/CWgbtLIPY74djxaTABJqaGjzBAb1yy9iG//IgXZ0gyYnwKKqiyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="n2drT/mh";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54489606A338
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 20:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54489606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n2drT/mh
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-49412eb1474so1992270f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 12:36:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794861417; cv=none;
        d=google.com; s=arc-20260327;
        b=Qcc+TWsLmYPdLZqXTCMggVCpz0IYKrUjzkrBQUPFHCt0H9yNqf1O7bPPD6JVkYabxu
         TUWEupc3V4UIgl9vCisMDf9K0mRkrPrb5TG3O5qAkeVJ8czY+F5bV1YODO9Y5Sl5hyCX
         Os304ZZSncR9JW8iW/sMIsmBwJn2JW1u4LE+bQqnCQYL2MiCDYXp03y9L67CutrScnjH
         zVHlEVNhZ6iOqBO997OqFwVYk7z0S8stkNki0Ov5SEm4HMgFEyhOv2d3ELZ6K2NkOAh1
         8man/+9BySDCYPeYvgvC5lbvRpG8eSBe9uKrakseCYkclXm0O8PtpsBE83IpSgLLFe+J
         KPzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJTXcb4kfDqNpUGLwGWYlWQVn6Sv/SOC+HXp4SSgoC8=;
        fh=u9/M1HVr9XQl1SJ/aBiekk4wTAOLRVnPHqKYJrmNmiQ=;
        b=ojjrWCDCGTnsagCauP/PezLyxdIkx0eKOfDnDR3Hig1BBpL8IG8zvkruhVeosByVx/
         a2q9gyzhSPVyxPM+j93IdKrGlb9XPvWGjQBIF8s40U0jm52aOqIXs4MfUVnRvjegzE7r
         QCHFJLHqHjz1jj5P+VI9lECYmU52kbgM5tmjGySED4/q9xiVaGtJ89Bd4KidpRhiROZk
         vtl/RpgGWqgmnVMmGQ93/OJcPc7s55NR+haN1HTkPC3sXOm1BX/LuSi7kzRF7FJn/nRf
         tNyZhf4xWzfR2IYcKfKDPoa6ibGkDtZYjIgF2ANrKtKVggqWlil/LrFhl6ZpWJ39VsRH
         if7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794861417; x=1795466217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tJTXcb4kfDqNpUGLwGWYlWQVn6Sv/SOC+HXp4SSgoC8=;
        b=n2drT/mhhgU/2lCos8u7b+woLM0sWZOmBLQoW26YoEAOxN2e6MGx8TJKJ2dpNfQD97
         nn0EKC8O752fhDhPWOjv33kQV3jTaFO4v00NYwv77I8dOM8ikdZDAku2LmHat8yVDZvQ
         7GAj0yi5uAMNfNgtzsW1TV2eTbBxVFidisA4bBp5Q77XzIPYACgn28a1J7ZaAiTpBVvs
         K2jw7BKofCa6HnvmVlTjCOPECeIVrG3D5wwi4RyqeCW8OwtUS2Ktgct8WzTZTsxhXLoS
         aX1Jj3i4aA3HoqoUHJj+ejsV+Q2L6VPly3hHDbUSbHYQJYNH7N42pQmsSiZ5VzYHBpip
         UUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861417; x=1795466217;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJTXcb4kfDqNpUGLwGWYlWQVn6Sv/SOC+HXp4SSgoC8=;
        b=ElTwzblU7Mgk9aBrj9e+Kp/3A1XBcH9qo8hUg5pDqApnlvLR6HL85q42EEnvhpIixt
         pB9rp0LyqVVEZmKQcgA5y6O4JBSdMHLfKJF2o+JCowpMGuBtSH9exrhmUmw/bxM+QQ/V
         AzLpMDZD3gYWDMxeT4U2j8qUyeDtnAWGQHthJXh5PAcWgRxcGcu/UYhmgp72GCfY5ywQ
         hiu5YCvFl/Oi/nlbtio6Ai5fytF+JKBGIkA9L7HfOGudXK/DPDSEBQiALA/nlJl46ffs
         8HSEVxZbbrB0MTbSc1NzXKyeCq2d05ybD/Ed28YXALebG7th9fIXEzj4oNp0E3CV1//I
         pKSA==
X-Forwarded-Encrypted: i=1; AL+hErHyImM9LLbiRxR6DJgr5SAIFH8sZfo1pKTSQo1FmNjiLBYPe9Ff3RJeAN3Mn8n8832WWkph27VGavDcmAZ6s8U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/URqNti+R9uefaYuuwbxhsoUsgUwH/rZsqxJ2OkA6piCHaDAo+
	0XKSRhhvh4duoifyz07Kx0pblWs4f9fFkFFIqKUrbQ3w3xGFl/XqtBCo5cdmgOL6dFIvSGBpDc7
	mGFpTqds07varPhvKYmKSHUu0FCn3fjsuCzyU1Po=
X-Gm-Gg: AZFdTZc/EBfJZ+KXYZPpIQpf7G3C9/XJPtrfcX6pReQ2b1qVGHb6fQkwbNJEGIrY1y3
	dHRqFZ6MQOta41bqNV1yyOZpcbGEoubSp6R6ItmBhB8mysDJAbEmfD61n1/j60hqBPbtmury/0R
	gd4JRcP2OgTwR7PmutQLRWhnFUPpzLK54YQzD5CYIrnNBUtNaWfhzye95kxZoRU1DTz15VyN2nv
	mTGDhsOhrHiryP0JeU1T5CITbg6KhY3J0aky595whJWg3yzz+8e0tr3Ahan0xVZafNDGb7J7zUm
	MfoEaCMpGj57EVfQe059pvZJJR27Ka5rBt7uCTNx99N/LoiEpjulf2O2uGQp2JWMsQejGSaB65T
	kIgafgEqpn/L7KkWTVZNwC4u/ii5ZEAjGfgA3lF/AeSVAQRO9prF0PcM3e8lFq0SXABn4bHrR4A
	8tUWx2GwSe6e7z5Nuf0TKwtjm8B9oVrt7DjYsmrBNGEAvpJ9Ybgo9IOzrorj2KGIMrZ4AUkt53w
	9aCIPG43rv3SKg0qCsdMEhJbJ5jJpKfLNQQ1WOwsDKQIKHAhdOS8w==
X-Received: by 2002:a05:6000:4918:b0:492:b1c5:6db4 with SMTP id
 ffacd0b85a97d-49c723fc793mr23702531f8f.26.1794861416243; Mon, 16 Nov 2026
 12:36:56 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com> <20261116192638.233125-4-mathieu.desnoyers@efficios.com>
In-Reply-To: <20261116192638.233125-4-mathieu.desnoyers@efficios.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 16 Nov 2026 12:36:43 -0800
X-Gm-Features: Aa3M54rY3899nRZqbPjomLbyfBxKQS4NldLCQkCR8AmmwfZuDgTEli0Ny-YYWrg
Message-ID: <CANDhNCoALeuVrkVozbRdn9f-aOLuAfBhP4pZ8eecH1Qsnd0Jww@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/8] sched/proxy: Stop the chain walk when the
 blocked_on chain is a cycle
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, linux-kernel@vger.kernel.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	connoro@google.com, arighi@nvidia.com, akpm@linux-foundation.org, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:26=E2=80=AFAM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> find_proxy_task() follows the blocked_on chain from the donor to a task
> that can run. It holds the rq lock, with interrupts off. It has no bound
> on the number of steps.
>
> The walk relies on the chain having an end. The ww_mutex die and wound
> paths clear blocked_on for that reason. Their comments say that circular
> blocked_on relationships would not resolve otherwise. But two tasks that
> take two plain mutexes in opposite orders deadlock for good. Once both
> are on one runqueue, the walk goes around the cycle forever.
>
> Without proxy execution, such a deadlock leaves two tasks asleep, and
> the hung task detector can report them. With it, the CPU locks up with
> its rq lock held. Other CPUs would then block on that lock. In a test
> with two CPUs, the guest stopped without a message.
>
> Fix this by detecting the cycle. The walk remembers the task it met at
> its last step that is a power of two. When it meets that task again, it
> stops the donation and deactivates the donor. The donor then sleeps on
> its mutex, as without proxy execution.
>
> Fixes: 7de9d4f94638 ("sched: Start blocked_on chain processing in find_pr=
oxy_task()")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---
>  kernel/sched/core.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)


So this looks like it duplicates the following two changes in my series:
  https://lore.kernel.org/lkml/20261023220431.1106611-6-jstultz@google.com/
  https://lore.kernel.org/lkml/20261023220431.1106611-7-jstultz@google.com/

And I've recently found there's a few other spots that we need to
bound chain walking (though I believe those additional cases are still
out of tree in the full proxy-exec series).

thanks
-john
