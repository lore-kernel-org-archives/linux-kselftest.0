Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8D4568FBC;
	Thu, 10 Sep 2026 18:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789063238; cv=none; b=rm8Kf2ekF6Y2tjhikbWUFcFIdHLEu2OdMQsfoV+9BU8p5OXDZjHADOOgoWMCn0QT40QxDrNTs3xqv736Rs61J1BbH0hF6YnkKe0gRYqm6ZZegRAcr3rfZIwEMKc27+NWMwUpEQWd6ktHGZT6nUEzAIXnz3wgWQgsioTup+TALkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789063238; c=relaxed/simple;
	bh=DeXoN6QhpkHY5+UPXooB4w6pY98CB3F68ATa1btubvA=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HM5M3DsqvjTdMGL0baNjcuKTr8Y4nSplstfw8YM29kIdAwFQbyvdRBVOr22cPpSCkao4qKYJ32+yNG4nMsaEqxoQoYMZ97YlDNsXPttTuNFq7PKMBsI5PSqibcJYOHiOwIR92kf8lT7ahCkUBEzMLy2pfrmFez2pJVPJbEt17JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jv9l/rSI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jv9l/rSI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15411F000FF;
	Thu, 10 Sep 2026 18:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789063236;
	bh=yXrVFHMenVTbXY0cN3vc0dA1QSUOVSHxV+UNmG/7P+M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Jv9l/rSICWAUk1BxZpUG1AUK2auAoG/BwIaQlelHR0qcZuN4y7xBIKLZhtFYCRMRV
	 VFyuuztx4Sznk5E/T5lGp+1POFe6JSU6IlX0jMof3N0WgqeF0qqZDoNSLofLHlCTWc
	 skXWEfGDel33/Nlf93elKPX7BfOYsrt0gtZgaJPPhGelN+N/sTt6La08NIIsm0Hzkp
	 aF7jJNj7qMjkiSDLiCJAC4gBFRjECTHoeGXuxMB2Z4SjNne+3XAquDufFequ4KbQyT
	 HIRcCMqhRwQTGpuxRHS4yBxuNMfvFuYk8ixozBJq8hr/NBQJ8f/pzCILXZHm2DJF2X
	 xHLU9Vq1SQPdA==
Subject: Re: [PATCH net-next v2] selftests: net: add ctl_file_write() helper
From: netdev-bot+sashiko@kernel.org
To: kuba@kernel.org
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 bobbyeshleman@gmail.com, shuah@kernel.org, cjubran@nvidia.com,
 cratiu@nvidia.com, noren@nvidia.com, willemb@google.com, petrm@nvidia.com,
 linux-kselftest@vger.kernel.org
Date: Thu, 10 Sep 2026 18:00:35 +0000
Message-ID: <178906323551.219967.4707818781145133711@kernel.org>
In-Reply-To: <20260909180009.1894019-1-kuba@kernel.org>
References: <20260909180009.1894019-1-kuba@kernel.org>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 0

- [Medium] In `setup_vf()`
  (tools/testing/selftests/drivers/net/hw/devlink_rate_tc_bw.py:110-118)…

--

selftests: net: add ctl_file_write() helper

This adds a ctl_file_write() helper to the net selftest python library which
writes a value to a sysctl/sysfs/configfs file and defers restoring the old
value, and converts several open coded versions of the same pattern in
gro_lib.py, devlink_rate_tc_bw.py, toeplitz.py and ring_reconfig.py to use it.

> diff --git a/tools/testing/selftests/drivers/net/hw/devlink_rate_tc_bw.py b/tools/testing/selftests/drivers/net/hw/devlink_rate_tc_bw.py
> index 4e4faa9275bb..38d712755257 100755
> --- a/tools/testing/selftests/drivers/net/hw/devlink_rate_tc_bw.py
> +++ b/tools/testing/selftests/drivers/net/hw/devlink_rate_tc_bw.py

[ ... ]

> @@ -113,8 +113,7 @@ def setup_vf(cfg, set_tc_mapping=True):
>      except Exception as exc:
>          raise KsftSkipEx(f"Failed to enable switchdev mode on {cfg.pci}") from exc
>      try:
> -        cmd(f"echo 1 > /sys/class/net/{cfg.ifname}/device/sriov_numvfs", shell=True)
> -        defer(cmd, f"echo 0 > /sys/class/net/{cfg.ifname}/device/sriov_numvfs", shell=True)
> +        ctl_file_write(f"/sys/class/net/{cfg.ifname}/device/sriov_numvfs", 1)
>      except Exception as exc:
>          raise KsftSkipEx(f"Failed to enable SR-IOV on {cfg.ifname}") from exc

[Severity: Medium]
Is sriov_numvfs a good fit for the "skip the write if the value is already
set" semantics?

If the interface already has one VF enabled when setup_vf() runs,
ctl_file_write() takes the early return:

tools/testing/selftests/net/lib/py/utils.py:ctl_file_write() {
    with open(path, "r", encoding="utf-8") as fp:
        old = fp.read().strip()
    if old == str(val):
        return
    ...
}

so no defer is queued and the VF is never destroyed at the end of the test.
The previous code wrote 1 unconditionally, and the kernel accepts that write
even when the count already matches:

drivers/pci/iov.c:sriov_numvfs_store() {
	...
	if (num_vfs == pdev->sriov->num_VFs)
		goto exit;
	...
}

so the "echo 0" teardown was always armed.

Does the VF teardown matter for anything besides the VF itself here?
setup_vlans_on_vf() registers no defers of its own:

tools/testing/selftests/drivers/net/hw/devlink_rate_tc_bw.py:setup_vlans_on_vf() {
    for config in vlan_configs:
        vlan_dev = f"{vf_ifc}.{config['vlan_id']}"
        ip(f"link add link {vf_ifc} name {vlan_dev} type vlan id {config['vlan_id']}")
        ip(f"addr add {config['ip']}/29 dev {vlan_dev}")
        ...
}

and setup_vf() itself adds "tc qdisc add dev {vf_ifc} root handle 5 mqprio"
with no defer, while setup_devlink_rate() programs rate-tx-max/rate-tc-bws on
the VF port with no defer. Those all used to disappear together with the VF.

With the VF surviving, does the second and every later test case in the run
fail when setup_test_environment() re-runs setup_vlans_on_vf() and
"ip link add link <vf> name <vf>.101 type vlan id 101" hits "File exists"?
The VF would also be left carrying the 125 Mbps tx_max rate limit and the
mqprio qdisc for unrelated later tests.

This state is reachable on a host where an admin pre-enabled one VF, and also
after any earlier run of this same test that was killed or timed out before
its defer queue drained.

One option would be to keep the explicit write plus defer here, since this
attribute instantiates a device rather than holding a tunable value.

[ ... ]

> diff --git a/tools/testing/selftests/net/lib/py/utils.py b/tools/testing/selftests/net/lib/py/utils.py
> index 184bb04343f6..1727bc418073 100644
> --- a/tools/testing/selftests/net/lib/py/utils.py
> +++ b/tools/testing/selftests/net/lib/py/utils.py
> @@ -357,6 +357,28 @@ def wait_port_listen(port, proto="tcp", ns=None, host=None, sleep=0.005, deadlin
>          time.sleep(sleep)
>  
>  
> +def _ctl_file_write(path, val):
> +    with open(path, "w", encoding="utf-8") as fp:
> +        fp.write(str(val))
> +
> +
> +def ctl_file_write(path, val):
> +    """
> +    Write @val to a control file - a sysctl, a sysfs attribute, configfs...
> +    and defer() restoring the old value, so needs a defer queue.
> +
> +    Writing a value which is already set is skipped, there is nothing
> +    to restore in that case.
> +    """
> +    with open(path, "r", encoding="utf-8") as fp:
> +        old = fp.read().strip()
> +    if old == str(val):
> +        return
> +
> +    _ctl_file_write(path, val)
> +    defer(_ctl_file_write, path, old)

Would it be worth documenting in this docstring that the skip makes the
helper unsuitable for attributes whose write has a side effect beyond the
value, such as sriov_numvfs creating and destroying VF devices?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909180009.1894019-1-kuba%40kernel.org
