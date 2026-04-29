Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0394218BA;
	Wed, 29 Apr 2026 18:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777487460; cv=none; b=T8BWcWiWRNBUQov2nyKarRhCxu0Clw6wUIO4z9bz1jqb5ATpB1IUPqwHkNlGYImwpWQCdZHB6uOYmPO7btvwM3k3U/Ykr/keiWB3FvtuphxjRhBnVRm7GHv607q3bpJ+k1Z3HgtQCn4Lqo2NVr1AbaTnLdTFA7FygRWNhK4Q9sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777487460; c=relaxed/simple;
	bh=bgWL5yreGU6EOhTvdm4dR6El/yNdFdQuGrwByui0qJ4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ZzuXJmMdLL5lWlo/aU9xLSIQxY6EprI0NnUPA5otQUkNxlCe274HWhDj94/naqkaOn76WBfglBYCoq4yRy6bEGx5HSs/bklN5cc36nussKYbeeXXcSC0+4i7JoVvJVwrSVYmg6qNrAYqy5OR83jFVnG5OmSs1dFvQWs7NJrCvJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cxsno8Bo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cxsno8Bo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D79C19425;
	Wed, 29 Apr 2026 18:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777487460;
	bh=bgWL5yreGU6EOhTvdm4dR6El/yNdFdQuGrwByui0qJ4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Cxsno8Bo50uAbiMikaaHDSDuqDoqy+lVxmmS+Ozn7ZBU0cdyp/CjKeoFjRuAD+m2e
	 dYNHLVvdFgpSNKhx2l5Hdr5OWM1n0l3XwbyqzTUpKZFjOMsclcrTuaOFvMKEIiFWFQ
	 O7skWUwJwxi3kmbbTC1SJyjOCmfLpySy1htcgJR04cKTVVR2PvZgy15eMXfukVKDcJ
	 Yrg4GVQ9DdYD1kg7Qhsz7sFZH2VN4JtEv4oAfDhBHU85B2KJ3uIckY5UIy1+IcMWBt
	 +YLpc/CAgB3Db799CP790xR8i5Qfe/mEiQhH4Id1m0xrbV5/gz5aoSJnvC4g9Lnlgh
	 8ALUqm94qu85A==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 2/2] kunit: qemu_configs: Add or1k / openrisc
 configuration
From: Nathan Chancellor <nathan@kernel.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: David Gow <david@ingeniumdigital.com>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
In-Reply-To: <19c00a88-ea92-4f17-afb6-9fa5da247d21@t-8ch.de>
References: <20260427-kunit-or1k-v1-0-9d3109e991e8@weissschuh.net>
 <20260427-kunit-or1k-v1-2-9d3109e991e8@weissschuh.net>
 <279a16dd-f98f-44ef-9685-44537eac2892@ingeniumdigital.com>
 <19c00a88-ea92-4f17-afb6-9fa5da247d21@t-8ch.de>
Date: Wed, 29 Apr 2026 11:30:51 -0700
Message-Id: <177748745166.3546642.1926308273567752538.b4-reply@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=625; i=nathan@kernel.org;
 h=from:subject:message-id; bh=bgWL5yreGU6EOhTvdm4dR6El/yNdFdQuGrwByui0qJ4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJmf/BI/VUfoahduO9Vd9ja+4te2mfrhhzMWH2dWKbtcs
 bUuKS+qo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEwk8jMjw70vE7/7L7FPk6iV
 TmT3/+/xzKqCecLh1JTAQz8SXzP9v8Lwh2fGYi/nZ31zfd9H5JTxPFyXYz5v5i8ZFjuVuof5qUv
 zeAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On 2026-04-29 13:14:42+02:00, Thomas Weißschuh wrote:
> On 2026-04-29 18:10:58+0800, David Gow wrote:
> > Do we want to split the series and take this patch via kselftest/kunit, and
> > the generate_compile_commands one separately, or just pick both up in the
> > same tree?
> 
> They should go through the same tree as otherwise kunit.py will fail to
> build the or1k architecture, as it always tries to generate
> compile_commands.json.

I don't anticipate any conflicts from the gen_compile_commands.py
change, so I think you can just take both through whatever tree you
prefer. I'll provide my Ack shortly.

