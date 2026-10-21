Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577840;
	b=xKhRMBhfWm3poErQdAOjTF+5JfuSfVUVRpTZmrq1+JMrA5Wqu/7mrnISt4kka//BhbdH
	 2ELdqkrTxoUWnFAZP5We+z7SKRLZc+vk500lVrGJTRqsSf0725mGUuL18TCRmJgbeiTxQ
	 T8Y/6aKjaeSRU9ItZoMbdn6A+PYf7RrSjHdjQrDg79dg4h4CtcA9KSqRAPC2owiujgzTt
	 p5M06bNUYfthROv3WF2DsfrwtMRlJn1+mVuGYyO5ZeYnVaFvjSk7nVPROvdEuBz+E9SD/
	 subr09hlDW4W6/blGkIjWlRyt1inFlPKAk7KFdwOmf6JuVqfvd/ypGZWBwyBg7bQeIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577840;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=Kt6vo4l51awhjqq3I2zXUePIjWcvYUZXxZ9RPkgXQb4=;
	b=uULjwi3jUUuDA7nU5ZJMuhRIVQBxwT7yu031IM6sxEG9XGTLAvTgpjy6UjFCR/oQ2JMH
	 GxQfpwnUv9WdY52GDoxN/388ZEteX5bWeKuyO0zt49fJnTq2q0TwEV9ZteJm/iWTbV9xU
	 OWNyz02p1N01dZ4eXNt6gR+mb8UV2BKbvPLNtb6chg28kVyCHtK3BAuBULzAiEXc5FD9r
	 oTM+OgsK4W0OLxmpiliXnmbY/rAFg2pvUPqIVWtwuCeOAkro5Orf8XN/xFqroyvKriZfn
	 kp01fjop4fHOObWeUCpf4zSq3ekS1w2DHG34eq7/m/0ksH8DNc+n2HLv3eIDQCsN91w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ua7oM8fD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964D3606A319;
	Wed, 21 Oct 2026 10:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ua7oM8fD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE3D61F000C9;
	Wed, 21 Oct 2026 10:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792577840;
	bh=Kt6vo4l51awhjqq3I2zXUePIjWcvYUZXxZ9RPkgXQb4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Ua7oM8fD2K3FMaghCaMTRd9ndhsONSrpG8JtFqKFRH7QkzZYnNXA15wEiVNRYcXDG
	 /ZrdAvrUX1dtBFeRhboJ87hFl8Lzk2RKkMo+bHOPOlIZFAoDm3FUFDBYiwNrXbzbiD
	 o5PqeyWU4ITidvmG4Pin2asL7HiPpAK5VRQp/lO2O9dQyJoeQua+dNbvzRJ8i0iXzw
	 17K2T8spJdWwbNdFEGl73ma9zW0rwXlPoPHGDVLapHBQ+CXK8paHtxovCMXXD2WYB6
	 AqVhpfGAghihIMoozPSch1/UiP0HFf8Obo5ajBAhbOVNVfIEePRmHOtVNCEyx3kiUa
	 Jdp96m58i4GhA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org,  rppt@kernel.org,  shuah@kernel.org,
  akpm@linux-foundation.org,  linux-mm@kvack.org,  vipinsh@google.com,
  linux-kernel@vger.kernel.org,  dmatlack@google.com,
  kexec@lists.infradead.org,  pratyush@kernel.org,  graf@amazon.com
Subject: Re: [PATCH v2 2/2] selftests: liveupdate: Add tests for
 LIVEUPDATE_SESSION_FREEZE
In-Reply-To: <20261020144710.4154339-3-pasha.tatashin@soleen.com> (Pasha
	Tatashin's message of "Tue, 20 Oct 2026 10:47:04 -0400")
References: <20261020144710.4154339-1-pasha.tatashin@soleen.com>
	<20261020144710.4154339-3-pasha.tatashin@soleen.com>
Date: Wed, 21 Oct 2026 12:17:16 +0200
Message-ID: <2vxzzew7fjdf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Oct 20 2026, Pasha Tatashin wrote:

> Provide luo_session_freeze() in the liveupdate test library and add unit
> tests in liveupdate.c covering the LIVEUPDATE_SESSION_FREEZE ioctl. The
> tests verify that non-zero reserved bits are rejected with -EINVAL, an
> outgoing session with preserved files can be frozen early, freezing an
> already frozen session returns -EBUSY, and attempting to preserve an
> additional file descriptor into a frozen session fails with -EBUSY.
>
> Also freeze the test session early in luo_kexec_simple.c to exercise
> LIVEUPDATE_SESSION_FREEZE across a kexec reboot, and verify that
> attempting to freeze a retrieved incoming session returns -EINVAL.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
