Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF59B1E5207;
	Tue, 24 Feb 2026 02:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771901602; cv=none; b=j3aF7KJlNy0gDQZEgiSxZvpjOXZ4X2uUqZJZSITvEFDlXt0DHEUtMfuZNW4XX9opRBfIAlexWOQHfM1FgB2IGsPOQMzYhxHdOaRj4cENr4h6XpbNyf+c8Mg4cbzKOZyjWE/ZfD4wn9wMSBEB/yliMfBxoY7d/hH7dTiotyPNtow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771901602; c=relaxed/simple;
	bh=cL4SmLRTxnUQEaMuTZ+86puqXD4u2LSMw82NDMeSfGo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hbW3GVvU3xJBro2GIl+DhYDD44woNyy+Ux0fzM+HlUxJqp6TEt30s5ElTBowVaP/gQFSVjy77YwT2cVydw6WpMOZPgxBSNGxURzjCX6oyjZ4Do6gSRcV2YIR6t/Cht23fprsPdT/soGLO9lilOmAvYhREtbH+Xbkg9spWdneZSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYq0nNG6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYq0nNG6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED797C116C6;
	Tue, 24 Feb 2026 02:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771901602;
	bh=cL4SmLRTxnUQEaMuTZ+86puqXD4u2LSMw82NDMeSfGo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dYq0nNG6eBQ2T+bdBm4FH+ZBUZz8Pw45utS6huRsNlB2gdyiKxtKeFZztfacT0Mtw
	 jQ2oTVYBLie48NVQOBrCvmLz1zTtB1qzYXKl9y5zUtY/DR55ep1H6eTu373VbXSEAE
	 rWh7KisvJT+G/AL+ejQWihZpkDZGixGeOAV2wd0vCDPvWWv+9m+ZROTplB7rXKn6Um
	 srURnGrnM5SwyMhUTN9HiHxFmRR2ul+006UxkxMTZBDUvtWJvveu98lUOzCLhVWTtf
	 3lOdl6bQqwkCZpBtoxEKKbE1oR+WTVICVx2GqfJRi77eG9lcVxBKJEjc10kiKJZvuz
	 A86bIrSDoHxpg==
Date: Mon, 23 Feb 2026 18:53:21 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: sun jian <sun.jian.kdev@gmail.com>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, kees@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] selftests/harness: fix XFAIL_ADD matching when test
 metadata is not initialized
Message-ID: <20260223185321.0f0581e6@kernel.org>
In-Reply-To: <CABFUUZEuMCYYfi-SapTLT1BhYOWBk1e-OYh+h9fOZcfoSP06fg@mail.gmail.com>
References: <20260222111847.692325-1-sun.jian.kdev@gmail.com>
	<20260223172214.5d8ddaa1@kernel.org>
	<CABFUUZEuMCYYfi-SapTLT1BhYOWBk1e-OYh+h9fOZcfoSP06fg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Feb 2026 10:43:15 +0800 sun jian wrote:
> > Constructors seem to have a concept of priority so if we have to,
> > we should probably used those for the fix.  
> 
> I considered constructor priorities, but I'd prefer to avoid relying on
> toolchain/linker specific init ordering here. 

I thought constructor priorities were specifically created to avoid the
problem you are seeing. What it is the point of constructor priorities
if not to order constructors??
