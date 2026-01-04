import requests
import pytest

def test_alb_is_up():
    """Verify that the Application Load Balancer is reachable."""
    # In production, fetch this URL from terraform output or env vars
    url = "http://your-alb-dns-name.aws.com" 
    
    try:
        response = requests.get(url, timeout=10)
        assert response.status_code == 200, f"Expected 200, got {response.status_code}"
    except Exception as e:
        pytest.fail(f"Infrastructure connection failed: {e}")
