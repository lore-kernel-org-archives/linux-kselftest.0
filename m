Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9514A3871;
	Thu, 24 Sep 2026 15:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264164; cv=none; b=It2w1LRAATDLfzbvkJ1R1tackPS4g15xVQYY28T2sntltkY/+y1taYvmN07hxbH4b2KO3NfutPjB3cl3mo1cc/i5j47f4kTjM7PTjbnnFBfiL/oYbT2Sa0NOslzNxUKQHkgTm3i+WZqdemfDWWqWWZQAgMUBlKxs3wnzAy7zfkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264164; c=relaxed/simple;
	bh=hAf8fXTdW9VLK/QP596l6v+yCl+M04nv+bp0wE9JOsU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CUm+0Z5hV+HFlffek9d07yznfB9ML8TAGCyS4E1Lr1Q3cPqkbwswNCU9l+MP+LsbRKLF+YuWq2lMMNIecJXFGjtyYliKTGG+wa9Z7moiPkvr2NzAlAUcj+YOD+/A29oyw/ylAb1dB9TJWaSX6RPf7ZRGISrhoMjiPWrzI8qfFNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXwAnSbd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXwAnSbd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9390D1F000FF;
	Thu, 24 Sep 2026 15:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790264163;
	bh=hAf8fXTdW9VLK/QP596l6v+yCl+M04nv+bp0wE9JOsU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GXwAnSbdyi6MSiPUc5j6gb79YHPSBzC/ikOr/xg3PMV3zVDwKW+2pJDtso+h4Ywgf
	 6YXq99qQpnoR9Nb5DGIgvtQCVbsPNRuP7eSXTuicNpe7L5ZtQEEQ7iAl94zKjr/Jdr
	 1oXNLeca4bnIbInkwMJLlxnhYAdi5KhPqOfYO7TBItSPX3BwHkj2NBTs9RbjUKCdzW
	 LFOCXJ5j5DJCWymecZNMvAb+hKKB9VprYDeBBhYGua4lk8VyNga5uY+702D61xgm77
	 DTEgERVKT7xtfmh4EjRwV8Yh5BVHE0LI2BdhSSTEvZC0ukYN/8wI/vna0Ql+jZoqq+
	 JiV49S2oHbmXw==
Date: Thu, 24 Sep 2026 08:36:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Aaron Conole <aconole@redhat.com>
Cc: netdev-bot+sashiko@kernel.org, houminxi@gmail.com,
 netdev@vger.kernel.org, echaudro@redhat.com, i.maximets@ovn.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, dev@openvswitch.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v5 1/2] selftests/net/openvswitch: add SCTP
 flow key test over IPv6
Message-ID: <20260924083601.651e11bd@kernel.org>
In-Reply-To: <f7tpky49mjg.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
References: <20260918144647.2024095-2-houminxi@gmail.com>
	<179008950943.2160803.15856491533624064435@kernel.org>
	<f7tpky49mjg.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Sep 2026 08:31:31 -0400 Aaron Conole wrote:
> I don't think either is needed for this series.

Aaron, did you mean to ack this series? You (rightly) dismissed the AI
slop review, but no ack. Or there's something else that I'm missing?
