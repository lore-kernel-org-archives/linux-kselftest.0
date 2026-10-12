Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1124E1A682C
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 09:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797639; cv=none; b=Uj740f2pOWVXh2NhTK9l5Y+khIqrtBpL/E46S6/SBNDLmhW4M6sXSRF5VE6u2I61+rg25kdwPVhEW8XQsJND2L1HSi7mrUIwqRRBgBbS6uj7GpJKbOeVPxnQpImzH2Bkz1VX58i6g69kRAKve9SAA9F+6pLST27I4FtC7KWN3bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797639; c=relaxed/simple;
	bh=WKKz/3cl5/0LmhT1lXJ3dxtvCRyP4Bw81TrQNWA5MYw=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Cc:Content-Type; b=l4lUx2dHEC9QgL/RAX5a2VaOR0zrtmINa4+jq654n4wT5GxzF7EMqER5RmeBwmQ++jhq0VHIrVf1YgfROK/dJs8z/9iVPu75EqD6+o5ZossXmHrruSqir4sdTOPYMwmhmfKxcZBMKI4puuUxAi2mtCAd4EjIn0pA5aGVuDgR+iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jABZiNTG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jABZiNTG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18FBE1F0089B;
	Mon, 12 Oct 2026 09:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791797637;
	bh=bfpOuXyEuAcRrhk2ON2GzJ/BHooFmAd2p5zVJuVCLvE=;
	h=Date:From:To:Subject:Cc;
	b=jABZiNTG8wW1OQL2V6vhmsZdzC3uwi8taldhkzcaZVmusOhHjmzotxW+ASYnpciGB
	 i3Z4HlC4/tTJ9wEcpV3BoFB0kXr/L9sTBq4p8dLx727FuLFg1ruMGfYlM/e1JG36u8
	 1xs1p/fddqHuJ3MPaZnicIzzryVu80SNReJZK2ewvxBxiINglL2kQaSNvUGKK+GFga
	 z2qvjQaLwQelXHPfHrGbXMspeOXRxE5U/G1IzUzvNiBCpqk/jgLGl47zK6WYwLPNTG
	 UU+/n/8Auo8xQy00RzN+WTB+tBM2uSH/cUM4NVRr1IU6auWoQfESs7gkw7FK7EAYL5
	 m1huK4AwksmGg==
Message-ID: <9e60aac6-cb92-4acd-a638-340f78c3298b@kernel.org>
Date: Mon, 12 Oct 2026 11:33:53 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Matthieu Baerts <matttbe@kernel.org>
Content-Language: fr
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Selftests: net cases validating internal behaviours
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
Cc: Kernel Selftests <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shuah,

At Kernel Recipes, we talked about selftests, and the fact it is
difficult to have some net tests supporting old kernels. You asked for
examples, here are two of them, with a bit of delay, sorry for that.

- The best example is certainly the Packetdrill tests (tools/testing
  selftests/net/packetdrill). These tests execute some system calls
  (e.g. socket creation, connect, send data, close), inject some
  packets, and check the kernel behaves as expected by validating
  sent packets and internal MIB counters, e.g. buffer size, etc.
   => The kernel can behave differently -- optimisations for the packet
      size, buffer size, etc. while the userspace interface is the same.
   => It is difficult to keep a compatibility with all kernel versions
      when validating internal behaviours: the userspace doesn't (need
      to) care about how data are exchanged, internal buffer size, etc.
      as long as data are moved from one end to another.

- For MPTCP that I co-maintain: features have been slowly added during
  the upstream process. Some features appeared without changing the
  userspace behaviour, e.g. with MPTCP, we can have multiple paths
  between the client and the server, but the userspace applications
  don't have to care about how paths are handled. When MPTCP got
  introduced, only one path could be used. When multiple ones could be
  used quickly after, there was no API change by design: the same
  syscalls were used: socket(), connect/listen(), write/read(), close().
  Most of the time, we try to introduce new MIB counters linked to new
  features, but sometimes that's not the case, e.g. the path-manager got
  optimised not to create duplicated paths, or to support paths with a
  mix of IPv4 and IPv6 for the same MPTCP connections. These internal
  changes didn't get expose to userspace. To have the latest selftests
  being able to run on older kernels, we look at /proc/kallsyms, but
  that's not always enough, we fallback to the kernel version in some
  rare cases. See: tools/testing/selftests/net/mptcp/mptcp_join.sh, and
  look for mptcp_lib_kallsyms_*, mptcp_lib_kversion_* and
  mptcp_lib_get_counter. That's not easy to support all.

I don't know if it is specific to net tests, but when validating
internal behaviours, it is difficult to support all kernel versions. We
could expose more capabilities to the userspace, but that's not
something common here with the net tests, because (normal) userspace
programs don't have worry about some internal behaviours: that's why
some protocols are supported by the kernel, not to have to worry about
internal behaviours. If we want net selftests to be executed on older
kernel versions, we will need quite a lot of modifications, which will
be hard to maintain.

Do you think the documentation can be updated not to suppose all
selftests can be executed on any kernel versions?

  "Kselftest from mainline can be run on older stable kernels."

  https://docs.kernel.org/dev-tools/kselftest.html

For the net subsystem, it might be better to backport new regressions
tests linked to a bug fix, than trying to execute the latest selftests
on older kernels.

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.

