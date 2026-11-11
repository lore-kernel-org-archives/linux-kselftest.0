Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389861;
	b=NoaDeK+OT50J6/xxTSxYkS79oUi0DFQahHVG4fRTt3HbnTzszOfXgeKmcdSAnZ3ysY4C
	 fsROQ4/TKdjhg9WJ61dQM6CoSTWOrvDu1x+/YGCvDh0uwLDGkgsH0QzGqRWguc7cqGQQY
	 pmnU3y8E4C4nfvY8zOo049nQbQ6t3U6oefT1MYtLfttQJHnwHdoydwuBYWjAponHnygXS
	 HYtGHfFeK8DXeP5HGsJc1X8EH9Sg8zA+6pi0X3d1GMzTkNZCozLLX3HQ7VbtP34A7R4tm
	 C1E0Q4S8cW8ITaKTPp2bawUoQHskrmD6dRMsePA5Q7xe+GHW345z54qnAwhtspn42+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389861;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=nnXnf7y1PhveoLpCg+02OBOmFeyqhtp88iWcIsSbdDc=;
	b=tmMKoiXLTGFTGA1FvYTa7IAXE1w5olD3d2fma3a1CbhvVYAoVUzI75AdrMPWUtyQ+mQK
	 +qMF9l+OkhliLz/R8gJSqU+kkYu1bJZk5RfvS/CQdWh2ae78EBERhSF0Li9CeHtB5e34c
	 hImrY3PtJICi1hhR5wncMFAnUXo6s2mEYh3qq6boK7AmFV9SVJT8gA90fFCa0/gkrEI5W
	 7ILsU8O/ZcgnbuTWtBuJp3uiB9oGSSd5ChgY+c1kp9evnLqvjzQp0W0aIW/24j4ZYFN07
	 cLxaUgGfWrqUmO3X2s3rxCt9KMeVx6Q4796zB0qq1ZHrOhzqJ94UuGvb4Qi43ws36Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nkjsJEtv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32DF606A31C;
	Wed, 11 Nov 2026 09:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nkjsJEtv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468AF1F00A05;
	Wed, 11 Nov 2026 09:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389861;
	bh=nnXnf7y1PhveoLpCg+02OBOmFeyqhtp88iWcIsSbdDc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nkjsJEtvfVlzfinnaA9/WA2KaQ0FfUbPigA2eQLesbpUeUeewvuZxWrLNv6VOe/Zi
	 979hO6ET/mprcOx0suJozkL53ZRnqRoKSkJoIhz7lhEdvl9m3aBRla8c6OaveCCTyd
	 WdikiYVnYekWNhADRJ/0fRd+CHBIqT9JgNLeYhs8v6gIEcFnoceEj6BbRYE4j3w09F
	 YUZWKYAj/KlRw3IpXWf8grMO8fQUxTAPBwF65YeocoMHRz6cYgWePGrSW53q8PBMkr
	 Ov3dSfS/JoNOhHKGm7N+ee6fJRdJh0hkMuHCtBSsXshQGkqByx8zJnc2X7lkc5d/Yv
	 Pm8YhC6BwZMfA==
Subject:
 Re: [PATCH net-next v3 01/14] dpll: dpllsim: Add simulated DPLL device driver
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, ivecera@redhat.com, jiri@nvidia.com,
 corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
 rdunlap@infradead.org, jani.nikula@intel.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Wed, 11 Nov 2026 09:37:39 +0000
Message-ID: <179438985979.2199510.15412273141557409959@kernel.org>
In-Reply-To: <20261109093523.931201-2-poros@redhat.com>
References: <20261109093523.931201-2-poros@redhat.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message says configfs was chosen partly because
  "Unlike sysfs, configfs does not imply a stable ABI, which suits a…

--

dpll: dpllsim: Add simulated DPLL device driver

This commit adds dpllsim, a driver that provides simulated DPLL devices
for testing the DPLL subsystem without real hardware. Userspace creates
instances through configfs under /sys/kernel/config/dpllsim/, sets a
clock_id and writes 1 to live to register the device with the DPLL core.
The device registers as a PPS type DPLL with only the mode_get and
lock_status_get callbacks.

> Keeping registration separate from creation lets a test register and
> unregister the same device repeatedly, which is where the core bugs the
> driver is meant to catch tend to live, and it allows the structural
> attributes to be refused with EBUSY while the device is visible to
> userspace. Unlike sysfs, configfs does not imply a stable ABI, which
> suits a driver whose knobs exist only to drive tests.

[Severity: Low]
Is this statement about configfs accurate?

The kernel has no ABI exemption for configfs. Its attributes are
user-visible interfaces and fall under the same no-regression rule as
sysfs.

The tree already documents configfs interfaces as ABI in:

  Documentation/ABI/testing/configfs-most
  Documentation/ABI/testing/configfs-thunderbolt_stream
  Documentation/ABI/testing/configfs-tsm-report

Neither Documentation/filesystems/configfs.rst nor Documentation/ABI/README
makes an exception for configfs.

The selftests in this series will use the layout added here,
/sys/kernel/config/dpllsim/<dev>/{clock_id,live}, which later patches extend
with pins/<pin>/{type,frequency,direction,prio}. External tooling may use it
too. After that, renaming or changing these attributes would break
userspace.

The layout is currently documented only in
Documentation/driver-api/dpllsim.rst. There is no Documentation/ABI entry
and no note saying the interface is unstable or for testing only.

Could the claim be dropped from the commit message, or the interface be
documented under Documentation/ABI/testing/?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261109093523.931201-1-poros%40redhat.com
