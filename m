Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795827354;
	b=2WYDlVAqfaR5b0ctrNjWV2YWdnUTkrQSa/IVdIVb8rKsd2JYZBxeA+hwUOjkcTqVP5is
	 Uiaj0EWJ5Q8Uq8CDulAgmHVzoZn9aAY7UvqAzvuad+iBFFwEijJfB8pdQHKGDYlw6TFap
	 v+/8Ocbsr0t+4PjHG48VWcu9qMOcOq59KbXQjxf5GqwSvgYt7/d1/yedVmZ4jqOLGRszy
	 ECv+L/8PuICrjdmoVviPQr+hTJQeVlciG7spX7kXzw2kCJI/pXv1zqMjYZxcPfZ4ffmqe
	 mS0CIlR8rhKqbyO2yE1cNgK3Xreifv17Pqgr1zJ5X2KXeShGIiVuzT7iaXgyNw1Gh0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795827354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M4YJXz2C1qqMpFfvawPlwYq2ZIDKs+0ke0HB93yAMqs=;
	b=Klx2GyqEQZdSbS4PY+yFZ6b2yEQPE8s4jInsvWJxSNzRXSuyoz2sNAX9AQyx/qFbsp33
	 J3Yhx/oAZ7ja5hxZwlZX2YeLrTlTNmjkcXU7/kxtMO4kPktv6mMT/XVfgkjtuAwcutQ6Y
	 D1aPAbeMofHQi6FD/gBmVS7Qw1fi0pJc4nVj2oSjTifr9OHH3UzB+Fss8Bl7Z88rLGwUg
	 kpLQIkBLmGiHxLeRNMF7bs28AhWVpT/ySeoD6mE08m/haqBC4zjDULJf5f/dilmxOKFXc
	 fq9rGA7CmVrXuvmfZcoF6O4NgXE05RgPjFX7Hpw8R96mIEVMYhxZOuogMS+DrLcDyCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=egc5oRyU;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFAF606A326
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 00:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADFAF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=egc5oRyU
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so58026655e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 16:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795827352; x=1796432152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4YJXz2C1qqMpFfvawPlwYq2ZIDKs+0ke0HB93yAMqs=;
        b=egc5oRyUW6VFDIcdxYwZDeGVcRPdqVVcw0/9bUs8kD5ZsjJsFc0wc7Ij4lq+IUwayF
         w2XgNkLL/plAb0xjtXjWDmbgHsj8BbN8y5QH4zabvGdDwwb8xzCpvOiS/FFDQ1pAmNwA
         4uiU6YjDORB86waZuFacytNoIhdLmWlhX93TlunzFDHBxP1tk3JWqemA4JUyNxNFOtfh
         CKwdIz1EOzEmUqFvrYxqw/6yXUkip8rv4zUWrx4HDc3q++gCUskaW4sXZoxU4kXNS894
         nnM8O1l8kivUFX2WTqpxfjbMSvlGbzGIvqyGbP1cvEGn8taKbCLd436XionhZ+TbNkl7
         Tb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795827352; x=1796432152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M4YJXz2C1qqMpFfvawPlwYq2ZIDKs+0ke0HB93yAMqs=;
        b=F6lR2PhcVMek0NRpb4w0c/bg2jb5QHnBRY4mqQDVd2Lec1fvwgsPSoK4GLc0/Nog5H
         kdN7oiUlPVF1jOc/pc0mAXHh9nwQ+HIQb2dWFWkfdxFF4MsX1tzm+p4SGCIN+q3BEcK1
         kfgjRM0CCiDwW3ruhPH89J981tluOG6jm3dY08EbhwOHe7M0byZqla1c+aAi3Ae1WDQP
         QgzwamCVjhmmQZb15u6cwPFecw5bC1qnaSZdI1sdvVPF72j9KFnogjja3ss7yteIBK0O
         W0XqZBkXq87F5d8PBoHtg7I2wI5C2U5zbBaAjWQFoUnlBfOrPm00SvieeCjc+cUqyxHO
         1qXQ==
X-Forwarded-Encrypted: i=1; AL+hErEzOs2s4HnOQRpO1gXysMkR6o5wq4WFuEaAWw0D4BPNIXtVuV5gMCiWceuLwS2gwtRir7BbmZmERws0HVGzDtY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iMw++1cFunMf+Vr1Nog2as1ZjIXgYtqLKVUm44zo625cTxD/i
	zZCz0vFAOkjl08XBye7UYNrWSEZcOuJG1mB6Ly+iR1upUIkrE0zMN5RF
X-Gm-Gg: AZFdTZfatiAQL+TJMSD78y5Xp+K0bSNuMMqZb7lNRPKFPI/S2ndsR46QnMCKhSiztlc
	FGQ7y8ljGPB6+fkaXG+a80YgBHegEiHvjwOA4GLzpbqO0VMGwHEKPirgSHEDo8NQseEFCCJmYU5
	KBnUiWi+fM5ChlhVfkyyXYuqSVlo3FJnw6AXiZydsFqtR2kYgjZP8wNEd7sjTkeqzdc4mvlMix9
	x0hzaysP/P4iK/4cadKF05d5OiUdWgWfo+KyJzT5js4i0etpXe8xKW6h7xwd+ks73yjSfgFKvIv
	tmh9bLWjbeGCNzWu+Ka3Q0jmKvW+Gb4n1HP0WZokdn2HS12kTI4yrX0rdUMqTXyEHxeg+7QWfGa
	jPaf1qVWdmFBDo8k2cQzVP1GK7zC6nm4O29x9ydBBFal9xm+/Y+1g7qCoI1CYlVlB3gHXEC+E28
	8QadFuThPcNjDUp+7GZNmgrFFa0/qyxk9gXjiCTvofqy+TRZVLJtdvJibj2+T7C2TwWVQsYbsTd
	zPnwmA8E6U4xa/38oQ1gwcmlVvKghL5Hn61ewWyM0TBwnRqTgQ3Jm02alQTc9EjoD2BhujNb62/
	cgdNQWwtjojlc1DUzpPAXSWAuQ==
X-Received: by 2002:a05:600c:4e0b:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb8881ae90mr541218935e9.32.1795827351797;
        Fri, 27 Nov 2026 16:55:51 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8538b09bsm1328407645e9.4.2026.11.27.16.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 16:55:51 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: jarkko@kernel.org
Cc: aleksa@amutable.com,
	alex@amutable.com,
	arnd@arndb.de,
	bpf@vger.kernel.org,
	brauner@kernel.org,
	containers@lists.linux.dev,
	corbet@lwn.net,
	dhowells@redhat.com,
	ebiggers@kernel.org,
	giuseppe@scrivano.org,
	hughd@google.com,
	jack@suse.cz,
	jlayton@kernel.org,
	josef@toxicpanda.com,
	kees@kernel.org,
	kpsingh@kernel.org,
	lennart@poettering.net,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-security-module@vger.kernel.org,
	luto@amacapital.net,
	neal@gompa.dev,
	oleg@redhat.com,
	paul@paul-moore.com,
	ptikhomirov@virtuozzo.com,
	sergeh@kernel.org,
	skhan@linuxfoundation.org,
	viro@zeniv.linux.org.uk,
	zygmunt.krynicki@canonical.com
Subject: Re: [RFC PATCH v7 00/26] userland: Userland containers
Date: Sat, 28 Nov 2026 03:55:41 +0300
Message-ID: <20261128005541.873229-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122193539.3334213-1-jarkko@kernel.org>
References: <20261122193539.3334213-1-jarkko@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Jarkko Sakkinen <jarkko@kernel.org>:
> Work on this feature started in 2025 after reviewing David Howells'
> container object patch set [1], whose underlying mechanics made sense to

> [1] https://lore.kernel.org/all/155059610368.17079.2220554006494174417.stgit@warthog.procyon.org.uk/
> [2] https://lwn.net/Articles/1102593/

You put wrong link in "[1]". This is not Howells' container patchset. This
is Howells' fsopen/fsmount patchset.

Link "[2]" seems to be wrong, too. It is not something "earlier", this is
very recent LWN article.

> While the patch set is manually written, the original motivation came
> from isolating LLM agents

LLM agents are too strong for Linux containers. They should be isolated
using VMs or using some Linux reimplementation, such as gVisor.

Bacik said that he tested his patchset in Anthropic. But I think it
was tested not for agents themselves, but for something else.

Anyway, I suggest to drop this phrase from your cover letter and think
about some other use case.

-- 
Askar Safin
