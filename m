Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A64910FD;
	Wed, 15 Jan 2025 00:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736901431; cv=none; b=DiYns0yWTJhTdLyccalc0AylT+YiK4fEMK+SbnbofW+pLNEBeDBDLQgCH86R45UlCLRKnPLMnfP6lCfoSyGgDXWZUGUsPJ+Ssj0M7Mv75TY6GmNgDVxRLe/pUUgwzgfiSy8hNu2pvTrghJJTMKfauBjmeV3VHQZcX9dfYn59qGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736901431; c=relaxed/simple;
	bh=6/RnUN9tmhamggdieo+kcWNFjotgcypKmza6qiCHKfk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q/dyuXJrZo+RmrfqdFpyK9k4uz0XdpFZIhTA65RsbwKCf/m+imFN/A70ABdunzsNOiUQixjKr0f/2wwGVIWe+1bAPU4EyQpc4wPOWYEtWlDfYA6Rx4703NRP/giqe8Z4mgcCZt9EDF/cYs9Tu/iaHPw3abd8mJk2+JPdIKSjxDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p4Gk7APu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p4Gk7APu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA8FC4CEDD;
	Wed, 15 Jan 2025 00:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736901430;
	bh=6/RnUN9tmhamggdieo+kcWNFjotgcypKmza6qiCHKfk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=p4Gk7APurrhFRGSnOwaHhW0E9vjVga8ZnIIEMuPmdlWgB4L/1A3DB2a+sn9wl01Bk
	 zkp6vFdsjKg/jTeDOyPlnSqEH0jRM/7y8WNtMRKuNtNwL7O+NuE3v4KsBv2P04gkBo
	 Ecf/aCa5uNE+D8X7OK1ORque2rXdf30/+1UWgxCcW5P2SRqxflfoszwEo3Z3g5sEu5
	 5ba+v8kGClSp6yxYgfXpON20yXKJFTvUdIgmNfJrIRigfltViKBVQnB1BtdZAwVHkp
	 0Ui1dtwKygMQtQbYcoCog3Sb3LtccKZXy/G0OM7b0g5aGf5OIxE46QMv1dkdLhGHEn
	 cP6U5jcgoo7WA==
Date: Tue, 14 Jan 2025 16:37:08 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: John Daley <johndale@cisco.com>
Cc: shuah@kernel.org, sdf@fomichev.me, willemb@google.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/1] selftests: drv-net-hw: inject
 pp_alloc_fail errors in the right place
Message-ID: <20250114163708.63e4d244@kernel.org>
In-Reply-To: <20250114223159.29677-2-johndale@cisco.com>
References: <20250114223159.29677-1-johndale@cisco.com>
	<20250114223159.29677-2-johndale@cisco.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Jan 2025 14:31:59 -0800 John Daley wrote:
> The tool pp_alloc_fail.py tested error recovery by injecting errors
> into the function page_pool_alloc_pages(). The page pool allocation
> function page_pool_dev_alloc() does not end up calling
> page_pool_alloc_pages(). page_pool_alloc_netmems() seems to be the
> function that is called by all of the page pool alloc functions in
> the API, so move error injection to that function instead.

LGTM, thanks!

Please resend and CC netdev@, tho.
