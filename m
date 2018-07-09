From: jhs@mojatatu.com (Jamal Hadi Salim)
Date: Mon, 9 Jul 2018 14:31:55 -0400
Subject: [PATCH net-next] tc-testing: remove duplicate spaces in connmark
 match patterns
In-Reply-To: <1531160535-17742-1-git-send-email-vladbu@mellanox.com>
References: <1531160535-17742-1-git-send-email-vladbu@mellanox.com>
Message-ID: <c5a89c01-d43f-cdd6-f70c-eb5d6535ba86@mojatatu.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180709183155.NLTOZIzbvoKWpyszhhb8A18XgSX4DNubYGIIcHhShu8@z>

On 09/07/18 02:22 PM, Vlad Buslov wrote:
> Match patterns for some connmark tests contain duplicate whitespace that is
> not present in actual tc output. This causes tests to fail because they
> can't match required action, even when it was successfully created.
> 
> Fixes: 1dad0f9ffff7 ("tc-testing: add connmark action tests")
> Signed-off-by: Vlad Buslov <vladbu at mellanox.com>

Acked-by: Jamal Hadi Salim <jhs at mojatatu.com>

cheers,
jamal
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
