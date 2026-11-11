Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419471;
	b=Dvvg+gBmqIl2/VkGIQKIhGNkHQjPxP4c8cfWtwTni5BLrcjUzEpj0xp9Os1ilYJOD6K9
	 5HofSVF9/orCUNhVf/mfc51fq+lacWEQDW0YJzL8vHIeF4cGnmOZ+49bMgESifP4JL1hQ
	 nUMq8JaRJDbmB+2xAbL88qsqKucVwHao6JneHy0JuZaX66on0cwR+a0tJGbnXRIVZdbBk
	 kp7fJoRgmXStM4QJz5Ouf4H1npBQ6vFHZPgqZzDr9wpD8sADEgeTomr9grY2gXS1jgfnz
	 uEyCEQ5wtXxdjL6x1pEFdmxLYk1HcFaCDOoN84pL9H5QQq4fSN6ScbakceZLCv0UGyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419471;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PJRu7W6/Or1we5Gv3BgoLEtby0D0Y0UGgfjBHfRc5+k=;
	b=kvIDvMORbdOudrk+T+ZvyDUtegYGmqnk0OsZ4Q2M3porxt6fa1lqbLaEmqwcgX/hlpnW
	 HnJE5esKciGFV3rGF1EzfVkw8xGw81pBDAd4DVnQjE/uxEaSINsdgyevkurSXEZLd2rSh
	 oDbK4ZTxHDdcYkFgecSfbFEPD2hSJexPVTTImXAke5B4owKlXga/FHzuRx2DlsLBq+/l1
	 YtvNdZPCQriyLFvDGi98pMcMraNKsk/iSX5M010FJ0cFJDiRXSNFu009w3nT/RQh+QbZF
	 g+cxKaSrDud4/i+gvrR1N03rjRNuxgH6nK/GEVDPEwHvs9Gdt49NuiYLFWKjm4JLoeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=afv9rgFJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C6C606A321;
	Wed, 11 Nov 2026 17:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=afv9rgFJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2811F00A05;
	Wed, 11 Nov 2026 17:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794419470;
	bh=PJRu7W6/Or1we5Gv3BgoLEtby0D0Y0UGgfjBHfRc5+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=afv9rgFJ0mHx4CtVMZewKH0BOrdi2SQQO8zZrOYdwvPhK+UJxk2XQYXx4UUmlcZC9
	 u8tMhIrL7AxEi+8CcR0G86zN51bOtJewWZisTgQ1Vyti5EQ8zUI4pcTbGJqiJg8Hps
	 xfjLFzPNeWMYFQs9Gv+W8+Da2g76G5Qx8EeL8gsoHM43wXaku4QVgR3yIWtgBMxTBi
	 ObXNYC5PVUP68wnKpQv8aafUAkBrCELkSdyxW2zl7Lr/CpfnhSQEubqArG/q52ke7X
	 /Xuki3IMSpO8ZNJ2Wy++acC1XAXPbtpoR6HpsWcWdmap8B/B2umPe6ckZllc+qHQWQ
	 BQb8aKvLTIpAw==
From: netdev-bot+sinfo@kernel.org
To: Juan Agustin Niccolini <juanagusnicco@gmail.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, ncardwell@google.com, kuniyu@google.com,
 josef@toxicpanda.com, jbacik@fb.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] tcp: Fix the SO_REUSEPORT bind cache admitting
 a conflicting socket
Date: Wed, 11 Nov 2026 17:51:09 +0000
Message-ID: <179441946966.2168702.5078417118584073258@kernel.org>
In-Reply-To: <20261111174704.24312-1-juanagusnicco@gmail.com>
References: <20261111174704.24312-1-juanagusnicco@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
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
