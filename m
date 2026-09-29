Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951F03E3152;
	Tue, 29 Sep 2026 06:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664874; cv=none; b=fmg1ckgAOUXa2viDup6GvBAE0f4xPq8uuqYgq4c+r9BBCx0dvqkoPni6xgwkyxgdyA5KqU6xNSIFZqv8XB8FUdlRe4QYjTPKduKnboxqqFur0HWASkadAd6KGaN6zQXLnC22cpRJwlg/dWOjwYqLKnlAsvHtyfShjTHDB5N85Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664874; c=relaxed/simple;
	bh=x8GQ9TqAFu5driuvo38kqzYt3n324pebOlaNmEELI+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XZfb1Rc7rq/eI5RN+Cr8JHmxJLjVjopWRBm7pVEqC3FaP6muYzlP9NuAWT8ZMPUD/77QRMbm0BoPXslzSPW2ftJqkReydVJNpuYaoDxjk20vNwwEBrd5NbFcTWraaVJ2mWmIv63Iag/T7XcKrwYeLJBliTOY5lCa7xA9anNqBNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8ZTzJEG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8ZTzJEG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF73C1F00893;
	Tue, 29 Sep 2026 06:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790664873;
	bh=PJRu7W6/Or1we5Gv3BgoLEtby0D0Y0UGgfjBHfRc5+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g8ZTzJEGgd6GeYWypu4lzpC73Q920gKSL0/hOcFp2acTS69cc69aeHC6H59zw+vh0
	 0XQgQoIU33p2Nvg3eh0npSPkJ7brxi7uvA3RQrc6/QlNZpbP+k1yIGKjLEOpJ1Lhnl
	 Ir5TILd1ZoG7GVvIVu4IfU2/eGZbwuHgYNee2S3qm3lMfUS4D2DgpSwGL8ikU1X3tS
	 PesEQLIMcirqSDBhoEe4/SNssiVKgZF2K4vYs07F//xF3B3Gi5S2WWAhw4u0tw1cWR
	 HdGCm3XywgIiPP5jCKkcWc6HQqrp0vnfYeiRt635Ji4jg9ZD5WsAZcU+oSbB4OlbdZ
	 M+gMoQZAonPcA==
From: netdev-bot+sinfo@kernel.org
To: liushike <liushike123@gmail.com>
Cc: netdev@vger.kernel.org, jmaloy@redhat.com, tung.quang.nguyen@est.tech,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: 
 Re: [RFC net-next 0/2] tipc: notify pending connects of peer node loss
Date: Tue, 29 Sep 2026 06:54:32 +0000
Message-ID: <179066487225.31693.13001631968601791232@kernel.org>
In-Reply-To: <20260929064742.576651-1-liushike123@gmail.com>
References: <20260929064742.576651-1-liushike123@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
