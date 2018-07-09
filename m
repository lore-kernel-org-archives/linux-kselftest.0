From: jhs@mojatatu.com (Jamal Hadi Salim)
Date: Mon, 9 Jul 2018 14:32:42 -0400
Subject: [PATCH net-next] tc-testing: remove duplicate spaces in skbedit
 match patterns
In-Reply-To: <1531160625-17839-1-git-send-email-vladbu@mellanox.com>
References: <1531160625-17839-1-git-send-email-vladbu@mellanox.com>
Message-ID: <14b90952-a222-a593-e8e1-9d3b9dcd7922@mojatatu.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180709183242.TrtBB5iERI0rfnbZKuSegNugOXolPeysHcvPYZXbCzk@z>

On 09/07/18 02:23 PM, Vlad Buslov wrote:
> Match patterns for some skbedit tests contain duplicate whitespace that is
> not present in actual tc output. This causes tests to fail because they
> can't match required action, even when it was successfully created.
> 
> Signed-off-by: Vlad Buslov <vladbu at mellanox.com>

Acked-by: Jamal Hadi Salim <jhs at mojatatu.com>

cheers,
jamal
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
