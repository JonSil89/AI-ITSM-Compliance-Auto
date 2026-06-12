import os

import pytest
import requests


def test_target_service_is_reachable():
    """Verify that the configured smoke test target is reachable."""
    url = os.getenv("SMOKE_TEST_URL")

    if not url:
        pytest.skip("SMOKE_TEST_URL is not configured; skipping infrastructure smoke test.")

    response = requests.get(url, timeout=10)
    assert response.status_code == 200, f"Expected 200, got {response.status_code}"
