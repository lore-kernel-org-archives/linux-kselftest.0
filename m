Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA76D3B27F7;
	Mon, 17 Aug 2026 19:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786995999; cv=none; b=VXJULHrSjQ1shQ30j37QfRx10EI9tb2NqZqLgJn0FnbDngHu3OV80oSgr5IkglL9QIjKyhW1gxTUidgtQj+Jg3WW6wxKAOZJJBJbRLUnorKpg958leuTIiqTq/YEf5EjWJykQ3a2ZnyUGO/H/x9xkMnQ2ZVweEfAdd9VQQs18vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786995999; c=relaxed/simple;
	bh=FkZvBK8pRQz7j6PC8ZUdHeti1SOZKhpidVb2A+1yIXE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=npzGYGjTexfGzvALyK+KZvvcFIB3VPBb1mfXSF8L09Im2IK0tuoj8dotrbiySA9hplg4N2S3E5n+gTMXw0aGiGetubrWC0TQLommUv3tlHSprcf1KlSW91T1VLOXjbAjbO4Yu3Z2Pn5KLcZ+czYy32sV8UKt4Y5SNWV4g1yU7c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBA8P8nl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBA8P8nl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3E21F00A3A;
	Mon, 17 Aug 2026 19:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786995997;
	bh=P+/rhBP8KQx/YWJt8eXm/+AkyHsUlWrW8px5nRnzrtE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QBA8P8nlfZuaP5mblhmWvlabJEQZh/N7rc+C1uhxzYrGkzkTeiTVmhHpa5WMnC5G0
	 EOXjlebQjK9MEzFbqV7MImVIfPuYr06xx2ciOV3i2OEilBkrmlvdW+8aeyhpDrh8JV
	 dUOYNYYufZRfs+a0KkEnwUb14mmmeamo8hBJGFY1Jfad2YXd4wg64gORzvRmgxE7Gd
	 92BieTwqCF11Mp/cMWc+DZBPAsGzicxO6XdE2T51d5nNVnj8i8VNsAXkhWmmlbGnZ3
	 eBL0hLl1PfXopGwAGtm17QzMlCDz8O5R7btjAmZLttGKxfkzFUoT5wmywOxK6zZlmR
	 Y67khiOo8uRXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198E63926262;
	Mon, 17 Aug 2026 19:45:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: net: separate ipv6_flowlabel_mgr test
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178699594964.1691257.13662709727520463245.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2026 19:45:49 +0000
References: <20260813030708.37609-1-marcelomspessoto@gmail.com>
In-Reply-To: <20260813030708.37609-1-marcelomspessoto@gmail.com>
To: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, afaerber@suse.de,
 mani@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 13 Aug 2026 00:07:05 -0300 you wrote:
> The ipv6_flowlabel_mgr used to be a component of a broader overall
> flow label test, defined in the ipv6_flowlabel.sh file. This wrapper
> script called tests defined on ipv6_flowlabel.c and
> ipv6_flowlabel_mgr.c files, using predefined parameters and enforcing
> the in_netns.sh helper to set network namespaces for each test env.
> 
> However, the ipv6_flowlabel_mgr.c was drastically changed recently.
> These modifications led to the mgr tests becoming a self contained and
> independent test suite, enforcing netns creation by itself and
> not relying on the ipv6_flowlabel.sh wrapper for proper test execution
> anymore. Therefore, remove the mgr tests from the wrapper and update
> the Makefile to handle it as a standalone test program instead.
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: net: separate ipv6_flowlabel_mgr test
    https://git.kernel.org/netdev/net-next/c/96bf660d4c14

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


